#! /bin/bash

cd $SLURM_SUBMIT_DIR
export GPUS_PER_NODE=8
HOST_ADDR=$(scontrol show hostnames $SLURM_JOB_NODELIST | head -n 1)
MAIN_PROCESS_PORT=12345

echo "SLURM_NNODES=$SLURM_NNODES"
echo "SLURM_NODEID=$SLURM_NODEID"
echo "HOST_ADDR=$HOST_ADDR"
echo "MAIN_PROCESS_PORT=$MAIN_PROCESS_PORT"

source .venv/bin/activate

torchrun --nnodes $SLURM_NNODES \
--nproc_per_node $GPUS_PER_NODE \
--master_addr $HOST_ADDR \
--master_port $MAIN_PROCESS_PORT \
--node_rank=$SLURM_NODEID \
finetuning.py \
--model_name ./llama-3-8b \
--output_dir saved_peft_model \
--use_peft \
--peft_method lora \
--enable_fsdp \
--use_fast_kernels \
--use_wandb \
--dataset alpaca_dataset