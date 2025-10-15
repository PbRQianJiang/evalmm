#!/bin/bash


CUDA_VISIBLE_DEVICES=0
export CUDA_VISIBLE_DEVICES=$CUDA_VISIBLE_DEVICES

export HF_ENDPOINT=https://hf-mirror.com
# export HF_HOME="/share/project/FlagEvalMM/cache/model"  # HuggingFace的缓存目录
# export TRANSFORMERS_CACHE="/share/project/FlagEvalMM/cache/model"  # transformers的缓存目录
# export HF_DATASETS_CACHE="/share/project/FlagEvalMM/cache/dataset"  # datasets的缓存目录

echo $HF_ENDPOINT

export HUGGING_FACE_HUB_TOKEN=""

# 运行 FlagEvalMM 评估任务
flagevalmm \
    --tasks tasks/blink/blink_val_ev.py  \
            tasks/where2place/where2place.py \
    --cfg /share/project/new_FlagEvalMM/config/robobrain_config.json \
    --exec model_adapter.py \
    --backend vllm
