import os
import sys
import random
import numpy as np
import torch
import logging
import argparse
import transformers
from transformers import GenerationConfig
from modeling.modeling_compact_llama import LlamaForCausalLM as SModel
from modeling.initializer import CompactorInitializer
from datasets import DatasetDict, Dataset, load_from_disk, load_metric
from typing import Optional, Dict, List, Tuple, Callable, Union
from transformers import LlamaForCausalLM, LlamaTokenizer, AutoTokenizer
from modeling.configuration_llama import LlamaConfig
from metric.spider.third_party.eval.evaluation import evaluate
from tqdm import tqdm
device = 'cuda'
def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('--output_dir', type=str, default="./state_dict")
    parser.add_argument('--model_name_or_path', type=str, default="AlexWortega/LLama2-7b")
    parser.add_argument('--seed', type=int, default=42)
    
    parser.add_argument('--cutoff_len', type=int, default=256)
    parser.add_argument('--max_new_tokens', type=int, default=256)
    
    parser.add_argument('--test_teacher', type=bool, default=False)
    parser.add_argument('--using_old_init', type=bool, default=False)
    parser.add_argument('--test_raw_student', type=bool, default=True)
    parser.add_argument('--using_trained_student', type=bool, default=False)
    parser.add_argument('--test_trained_student', type=bool, default=False)
    
    parser.add_argument('--learning_rate', type=float, default=2e-5)
    
    parser.add_argument('--sample_data_size', type=int, default=1024)
    parser.add_argument('--skip_num', type=int, default=2)

    return parser.parse_args()
def setup_seed(training_args):
    seed: int = training_args
    torch.manual_seed(seed)
    torch.cuda.manual_seed_all(seed)
    np.random.seed(seed)
    random.seed(seed)
    
tokenizer = AutoTokenizer.from_pretrained("AlexWortega/LLama2-7b")
# tokenizer.add_special_tokens({'pad_token': '[PAD]'})
tokenizer.pad_token_id = tokenizer.eos_token_id

teacher : LlamaForCausalLM = LlamaForCausalLM.from_pretrained("AlexWortega/LLama2-7b")
cutoff_len = 256
max_new_tokens=256

test_teacher = False
using_old_init = False
test_raw_student = True
using_trained_student = False
test_trained_student = False

#using for debug
model_config = LlamaConfig()
model = SModel(model_config)
# teacher : LlamaForCausalLM = LlamaForCausalLM(model_config)



output_dir = './state_dict'
    
def tokenize(prompt, add_eos_token=True):
    result = tokenizer(
        prompt,
        truncation=True,
        padding=True,
        max_length=256,
        return_tensors=None,
    )

    result["labels"] = result["input_ids"].copy()

    return result

def generate_prompt(
    question : str,
    answer:Union[None, str],
) -> str:
    if answer:
        return f"{question}\nSQL:{answer}"
    else:
        return f"{question}\nSQL:"
    
def generate_and_tokenize_prompt(data_point):
    full_prompt = generate_prompt(
        data_point["question"],
        data_point["query"],
    )
    tokenized_full_prompt = tokenize(full_prompt)
    return tokenized_full_prompt
    
def prepare_dataset() -> Tuple[DatasetDict, Callable, List]:
    raw_dataset = load_from_disk('./metric/spider/data') #or using load_dataset('spider')
    
    dataset = raw_dataset.shuffle().map(generate_and_tokenize_prompt)
    save_columns = ['input_ids', 'attention_mask', 'labels']
    dataset = dataset.remove_columns(
        set(raw_dataset['validation'].column_names) - set(save_columns)
    )
    
    validation_dataset = raw_dataset['validation']['question']
    
    def compute_score(
        model:LlamaForCausalLM, 
        dataset:Dataset,
        gold_dir: str,
        pred_dir:str,
        database_dir:str,
        val_data:List,
    ):
        pred_list = []        
        model.to(device)
        generation_config = GenerationConfig(
            temperature=0.1,
            top_p=0.75,
            top_k=40,
            num_beams=1,
        )
        for question in tqdm(val_data, total=1034):
            question = f"{question}\nSQL:"
            inputs = tokenizer(question, return_tensors="pt")
            input_ids = inputs["input_ids"].to(device)
            with torch.no_grad():
                generation_output = model.generate(
                    input_ids=input_ids,
                    generation_config=generation_config,
                    return_dict_in_generate=True,
                    output_scores=True,
                    max_new_tokens=256,
                )
                s = generation_output.sequences[0]
            output = tokenizer.decode(s)
            output = output.split(question)[1].strip()
            output = output.split('\n')[0].strip()

            pred_list.append(output)
        
        with open(pred_dir, 'w') as f:
            for every_line in pred_list:
                f.writelines(every_line)
        
            f.close()
        print(evaluate(gold_dir, pred_dir, database_dir, 'exec', False, False, False))
            

    return dataset, compute_score, validation_dataset

def run():
    args = parse_args()
    config = LlamaConfig()
    setup_seed(args.seed)
    
    dataset, compute_score, val_list = prepare_dataset()
    data_collator=transformers.DataCollatorForSeq2Seq(
        tokenizer, pad_to_multiple_of=8, return_tensors="pt", padding=True
    )
    train_dataset = dataset['train']
    val_dataset = dataset['validation']
    # teacher check
    if args.test_teacher:
        compute_score(teacher, val_dataset,
                    './metric/spider/dev_gold.sql',   # the place where the raw data place
                    './metric/spider/teacher_dev_pred.sql',
                    './metric/spider/database',
                    val_list,)
    model_path = os.path.join(args.output_dir, 'model_init.bin')
    # compactor
    if args.using_old_init and args.test_raw_student:
        model.load_state_dict(torch.load(model_path, map_location="cpu"), strict=False)
    
    elif args.test_raw_student:
        model.load_state_dict(teacher.state_dict(), strict=False)
        CompactorInitializer(
            model,
            train_dataset,
            data_collator,
            sample_data_size=args.sample_data_size,
            skip_num=args.skip_num,
        ).initialize()
        torch.save(model.state_dict(), model_path)
    if args.test_raw_student:
        compute_score(teacher, val_dataset,
                    './metric/spider/dev_gold.sql', 
                    './metric/spider/teacher_dev_pred.sql',
                    './metric/spider/database',
                    val_list,)
    #trainer
    model_path = os.path.join(args.output_dir, 'model_trained.bin')
    if args.using_trained_student and test_trained_student:
        model.load_state_dict(torch.load(model_path, map_location="cpu"), strict=False)
    elif args.test_trained_student:
        transformers.Trainer(
            model=model,
            train_dataset=train_dataset,
            eval_dataset=None,
            args=transformers.TrainingArguments(
                per_device_train_batch_size=4,
                gradient_accumulation_steps=32,
                warmup_steps=100,
                num_train_epochs=1,
                learning_rate=args.learning_rate,
                logging_steps=10,
                optim="adamw_torch",
                evaluation_strategy="no",
                eval_steps=None,
                save_strategy="steps",
                save_steps=30,
                output_dir=args.output_dir,
                save_total_limit=3,
                load_best_model_at_end=False,
                ddp_find_unused_parameters=False if int(
                    os.environ.get("WORLD_SIZE", 1)) != 1 else None,
                group_by_length=False,
                remove_unused_columns=False,
            ),
            data_collator=data_collator,
        ).train()
        torch.save(model.state_dict(), model_path)
        
    if args.test_trained_student:
        compute_score(model, val_dataset,
                        './metric/spider/dev_gold.sql',
                        './metric/spider/student_dev_pred.sql',
                        './metric/spider/database',
                        val_list)
    
    
    

    

    



    