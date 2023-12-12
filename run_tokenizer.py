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
device = 'cpu'

tokenizer = AutoTokenizer.from_pretrained("AlexWortega/LLama2-7b")
# tokenizer.add_special_tokens({'pad_token': '[PAD]'})
tokenizer.pad_token_id = tokenizer.eos_token_id
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


question = ["please check what is the oldest one in the school dataset", "please check who is the best score girl in school dataset"]
query = ["school", "school"]

val_data = {"question": question, "query" : query}

pred_list = []        
model.to(device)
generation_config = GenerationConfig(
    temperature=0.1,
    top_p=0.75,
    top_k=40,
    num_beams=1,
)
for question in tqdm(val_data, total=2):
    question = f"{question}\nSQL:"
    inputs = tokenizer(question, return_tensors="pt")
    pred_list.append(inputs)

with open("./tokenizer_output.txt") as f:
    for inputs in pred_list:
        f.writeline(inputs)