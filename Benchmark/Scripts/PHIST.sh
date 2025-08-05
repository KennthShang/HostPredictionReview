#!/bin/bash
#SBATCH --partition=cpu
#SBATCH --exclusive
#SBATCH --time=144:00:00
#SBATCH --job-name=phist
#SBATCH --output=phist.out






source activate phist
# MetaHiC
## need to split the input file into one sequence per file
python phist.py ../Data/HiC/cow/virus/ ../Data/HiC/cow/MAGs/ Prophage
python phist.py ../Data/HiC/water/virus/ ../Data/HiC/water/MAGs/ Prophage
python phist.py ../Data/HiC/gut/virus/ ../Data/HiC/gut/MAGs/ Prophage
