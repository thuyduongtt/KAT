#!/bin/bash

NAME='chkp'

torchrun --nproc_per_node=1 train_KAT.py \
  --train_data ds \
  --eval_data ds \
  --model_size large \
  --lr 0.00003 \
  --optim adamw \
  --scheduler linear \
  --weight_decay 0.01 \
  --text_maxlength 64 \
  --per_gpu_batch_size 1 \
  --n_context 40 \
  --total_step 8000 \
  --warmup_step 1000 \
  --name $NAME \
  --checkpoint_dir $NAME \
  --accumulation_steps 1 \
#   --use_gpt