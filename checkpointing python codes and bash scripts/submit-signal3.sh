#!/bin/bash

#SBATCH --job-name=test
#SBATCH --output=test.out
#SBATCH --open-mode=append
#SBATCH --time=0-00:01:20
#SBATCH --signal=B:USR1@60
#SBATCH --ntasks=1

timeout(){
  echo "cancel job"
  scancel -s SIGINT $SLURM_JOB_ID
  sleep 1
  scontrol requeue $SLURM_JOB_ID
}

trap 'timeout' USR1

date 
echo "restarted ${SLURM_RESTART_COUNT-0}"
module load releases/2023a
module load Python
python --version
srun --overcommit -n1 python -u count-signal.py & # || scontrol requeue ${SLURM_JOB_ID} 
wait


