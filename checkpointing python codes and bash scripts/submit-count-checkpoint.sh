#!/bin/bash

#SBATCH --job-name=test
#SBATCH --output=test_count_checkpointing.out
#SBATCH --open-mode=append
#SBATCH --time=0-00:00:30
#SBATCH --ntasks=1

date 
#echo "restarted ${SLURM_RESTART_COUNT-0}"
echo "execute count program with checkpointing example from the software itself...and without catching a UNIX signal."
module load releases/2023a
module load Python/3.11.3-GCCcore-12.3.0
python --version
srun --overcommit -n1 python -u ./count.py
