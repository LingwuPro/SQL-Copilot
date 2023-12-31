import logging
import torch
import torch.nn as nn
import torch.nn.functional as F
import numpy as np
from tqdm import tqdm
from datasets import Dataset
from typing import Union, Tuple, Dict, List
from collections import defaultdict

from transformers import DataCollator
from transformers import get_linear_schedule_with_warmup
from modeling.modeling_compact_llama import (
    LlamaForCausalLM
)
from .compactor import (
    LayerNormWithCompactor,
    LinearWithCompactorBefore,
    LinearWithCompactorAfter,
    LinearWithMaskBefore,
)



logger = logging.getLogger(__name__)
device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')

def sample(inps: torch.Tensor, size: int):
    size = min(inps.shape[0], size)  # (seq_length, hidden_size)
    indices = np.random.choice(inps.shape[0], size, replace=False)
    indices = torch.from_numpy(indices)
    return inps[indices]


class CompactorInitializer:
    
    def __init__(self,
        model: LlamaForCausalLM,
        dataset: Dataset,
        data_collator: DataCollator,
        target_sparsity: float = 1.0,
        sample_token_size: int = 8,
        sample_data_size: int = 1024, #4096
        skip_num: int = 2,
    ) -> None:
        self.model = model.to(device)
        self.dataset = dataset
        self.data_collator = data_collator
        self.device = device
        self.layer_dict: Dict[str, List[torch.Tensor]] = defaultdict(list)
        self.attn_dict: Dict[str, List[torch.Tensor]] = defaultdict(list)
        self.ffn_dict: Dict[str, torch.Tensor] = defaultdict()
        
        self.sample_cfg = {
            "token_size": sample_token_size,
            "data_size": sample_data_size,
        }
        self.skip_num = skip_num
        self.target_sparsity = target_sparsity
        self.handlers = []
    
    @torch.no_grad()
    def initialize(self):
        self.register_hooks()
        self.collect_data()
        self.clear()
        self.init_compactor()
    
    def register_hooks(self):
        size = self.sample_cfg["token_size"]
        for name, module in self.model.named_modules():
            if isinstance(module, LayerNormWithCompactor):
                self.handlers.append(
                    module.register_forward_hook(module.get_hook_fn(self.layer_dict, name, size)))
            elif isinstance(module, LinearWithCompactorAfter):
                if name.endswith('q_proj') or name.endswith('k_proj') or name.endswith('v_proj'):
                    self.handlers.append(
                        module.register_forward_hook(module.get_hook_fn(self.attn_dict, name, size)))
            elif isinstance(module, LinearWithMaskBefore):
                self.handlers.append(
                    module.register_forward_hook(module.get_hook_fn(self.ffn_dict, name)))
    
    def collect_data(self):
        self.model.eval()
        size = min(len(self.dataset), self.sample_cfg["data_size"])
        indices = np.random.choice(len(self.dataset), size, replace=False).tolist()
        sub_dataset = self.dataset.select(indices)
        for inputs in tqdm(sub_dataset, desc="collect data"):
            inputs = self.data_collator([inputs]).to(self.device)
            self.model(**inputs)

    
    def init_compactor(self):
        hidden_size = self.model.config.hidden_size
        num_heads = self.model.config.num_attention_heads
        head_size = hidden_size // num_heads

        module_dict_type = Dict[
            str, Union[
                LinearWithCompactorAfter, 
                LayerNormWithCompactor, 
                LinearWithMaskBefore
            ]
        ]
        module_dict: module_dict_type = {}
        for name, module in self.model.named_modules():
            if isinstance(module, (
                LinearWithCompactorBefore,
                LinearWithCompactorAfter, 
                LayerNormWithCompactor, 
                LinearWithMaskBefore
            )):
                module_dict[name] = module

        logger.info("init layer modules...")

        for i, (name, tensors) in tqdm(enumerate(self.layer_dict.items()), total=len(self.layer_dict)):
            if i < self.skip_num:  # skip first 2 LayerNorm
                logger.info("skip {}".format(name))
                continue
            layer_module: LayerNormWithCompactor = module_dict[name]
            inps, outps = zip(*tensors)
            # [(sub_N, hidden_size,), ...]
            X = torch.concat(inps, dim=0)    # [N, D]
            Y = torch.concat(outps, dim=0)   # [N, D]
            u, _, _ = torch.svd(X.T) # [D, N] -> [D, D], [D, D], [D, N]
                        
            w = layer_module.weight.clone()
            b = layer_module.bias.clone()
    
            layer_module.in_comp.weight.copy_(u.T)
            layer_module.in_comp.bias.zero_()
            layer_module.weight.copy_(torch.ones_like(layer_module.weight))
            layer_module.bias.zero_()
            layer_module.out_comp.weight.copy_(torch.diag(w) @ u)
            layer_module.out_comp.bias.copy_(b)

        logger.info("init attn modules...")

        # mask = torch.zeros((head_size,))\
        #     .scatter(-1, torch.tensor(list(range(head_k))), 1.0)\
        #     .repeat((num_heads,))

        for name, tensors in tqdm(self.attn_dict.items()):
            if name.endswith('q_proj'):

                match_name = name.replace('.q_proj', '.k_proj')
                
                q_module: LinearWithCompactorAfter = module_dict[name]
                k_module: LinearWithCompactorAfter = module_dict[match_name]
                
                # [(sub_N, hidden_size,), ...]
                Xq = torch.concat(tensors, dim=0)\
                    .view(-1, num_heads, head_size)\
                    .permute((1, 2, 0))  # [H, D', N]
                Xk = torch.concat(self.attn_dict[match_name], dim=0)\
                    .view(-1, num_heads, head_size)\
                    .permute((1, 2, 0))  # [H, D', N]

                uq, sq, _ = torch.linalg.svd(Xq)
                uk, sk, _ = torch.linalg.svd(Xk)
                # print(torch.diag_embed(sq).shape, uq.transpose(1, 2).shape, uk.shape, torch.diag_embed(sk).shape)
                # exit(0)
                M = torch.diag_embed(sq) @ uq.transpose(1, 2) @ uk @ torch.diag_embed(sk)
                um, sm, vm = torch.linalg.svd(M)
                sm = torch.diag_embed(torch.sqrt(sm))
                u = (uq @ torch.diag_embed(1.0 / sq) @ um @ sm).transpose(1, 2)  # [H, D', D']
                v = sm @ vm @ torch.diag_embed(1.0 / sk) @ uk.transpose(1, 2)    # [H, D', D']
                
                u = torch.block_diag(*(u[i] for i in range(num_heads)))  # [D, D]
                v = torch.block_diag(*(v[i] for i in range(num_heads)))  # [D, D]
                
                q_module.compactor.weight.copy_(u)
                k_module.compactor.weight.copy_(v)
                
            elif name.endswith('v_proj'):
                match_name = name.replace('.self_attn.v_proj', '.self_attn.o_proj')
                v_module: LinearWithCompactorAfter = module_dict[name]
                o_module: LinearWithCompactorBefore = module_dict[match_name]
                
                # [(sub_N, hidden_size,), ...]
                X = torch.concat(tensors, dim=0)\
                    .view(-1, num_heads, head_size)\
                    .permute((1, 2, 0))  # [H, D', N]
                
                u, _, _ = torch.svd(X)
                v = u
                u = u.transpose(1, 2)

                u = torch.block_diag(*(u[i] for i in range(num_heads)))  # [D, D]
                v = torch.block_diag(*(v[i] for i in range(num_heads)))  # [D, D]
                
                v_module.compactor.weight.copy_(u)
                o_module.compactor.weight.copy_(v)

        logger.info("init ffn modules...")
        for name, max_value in tqdm(self.ffn_dict.items()):
            module: LinearWithMaskBefore = module_dict[name]
            # indices = max_value.topk(k=ffn_k).indices
            # module.mask.copy_(
            #     torch.zeros_like(max_value).scatter(-1, indices, 1.0))

    def clear(self):
        for handler in self.handlers:
            handler.remove()
