#!/bin/bash
#SBATCH --partition=gpu
#SBATCH --exclusive
#SBATCH --time=144:00:00
#SBATCH --job-name=vHULK
#SBATCH --output=vHULK.out





source activate vHULK
# RefSeq-VHDB
## need to split the input file into one sequence per file
python vHULK.py -i ../Data/ProkaryoticVirus/ -o ProkaryoticVirus -t 40
