#!/bin/bash

#SBATCH --job-name=test
#SBATCH --output=test.out
#SBATCH --open-mode=append
#SBATCH --time=0-00:02:00
#SBATCH --signal=SIGINT@30
#SBATCH --ntasks=1

date 
echo "restarted ${SLURM_RESTART_COUNT-0}"
module load releases/2023a
module load Python/3.11.3-GCCcore-12.3.0
python --version
srun --overcommit -n1 python -u /home/users/m/j/mjoiret/CeCItraining/count-signal.py 
