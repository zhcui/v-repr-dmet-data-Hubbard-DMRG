#!/bin/bash

#SBATCH --partition=parallel
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=28
#SBATCH -t 120:00:00
#SBATCH --mem=250000
#SBATCH --exclusive
module list
pwd
date

export TMPDIR=/scratch/global/zhcui/tmp/

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export MKL_NUM_THREADS=$SLURM_CPUS_PER_TASK

mpirun --bind-to core --map-by ppr:$SLURM_TASKS_PER_NODE:node:pe=$OMP_NUM_THREADS python ~/program/block2/pyblock2/driver/main.py dmrg.conf

