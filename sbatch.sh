#!/bin/bash

#SBATCH --job-name=llama-finetune
#SBATCH --nodes=3
#SBATCH -D .
#SBATCH --output=O-%x_%j.txt
#SBATCH --error=E-%x_%j.txt
#SBATCH --gres=gpu:8
#SBATCH --cpus-per-task=120
#SBATCH --export=ALL

cd $SLURM_SUBMIT_DIR
srun srun.sh