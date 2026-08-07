#!/bin/bash
#
#SBATCH --job-name=test
#SBATCH --output=/root/result.txt
#SBATCH --partition=ProLUG
#
#SBATCH --time=10:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=100

srun hostname
srun sleep 60