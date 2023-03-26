#!/bin/bash

#SBATCH -a 0-10:10
#SBATCH --cpus-per-task=10
#SBATCH --mem=10GB
#SBATCH --time=0-65:00
#SBATCH --mail-type=ALL
#SBATCH --output=log/R-%x.%j-%a.out
#SBATCH --error=log/R-%x.%j-%a.err
python3 simple_task.py ${SLURM_ARRAY_TASK_ID} ${SLURM_ARRAY_TASK_STEP}