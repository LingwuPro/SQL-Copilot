import os
import sys
import random
import numpy as np
import torch
import logging
import argparse
import transformers
from transformers import GenerationConfig
from datasets import DatasetDict, Dataset, load_from_disk, load_metric
from typing import Optional, Dict, List, Tuple, Callable, Union
from transformers import LlamaForCausalLM, LlamaTokenizer, AutoTokenizer, LlamaConfig
# from metric.spider.third_party.eval.evaluation import evaluate
from tqdm import tqdm
from torch.jit import trace
from torch.fx import symbolic_trace
# from transformers.utils.fx import symbolic_trace
import sys
import torch

from torch.fx import Tracer
from torch.fx import symbolic_trace
from torch.fx.graph_module import GraphModule


# # 指定错误输出文件
# error_file_path = 'error_log.txt'
# error_file = open(error_file_path, 'w')
# sys.stderr = error_file

model_config = LlamaConfig()
model : LlamaForCausalLM = LlamaForCausalLM.from_pretrained("AlexWortega/LLama2-7b", torchscript=True)
model.eval()

# 创建一个示例输入，注意输入形状和类型需要符合模型的期望
input_ids = torch.randint(0, 100, (1, 10))  # 替换为适当的输入
attention_mask = torch.ones(1, 10)  # 替换为适当的输入
token_type_ids = torch.zeros(1, 10)  # 替换为适当的输入
concrete_args = {
    'token_type_ids': None,
    'position_ids': None,
    'head_mask': None,
    'inputs_embeds': None,
    'labels': None,
    'output_attentions': None,
    'output_hidden_states': None,
    'return_dict': None,
}

traced_model = trace(model, (input_ids, attention_mask, token_type_ids))

traced_model.save("llama2.pt")
# print(traced_model.graph)
# print("-------------------------------------------------------------------------")
# for node in traced_model.graph.nodes:
#     print("op: ",node.op)
#     print("target: ", node.target)