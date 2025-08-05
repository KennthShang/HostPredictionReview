#!/bin/bash
#SBATCH --partition=cpu
#SBATCH --exclusive
#SBATCH --time=144:00:00
#SBATCH --job-name=phagetb
#SBATCH --output=phagetb.out





source activate phagetb
# RefSeq-VHDB
phagetb -i ../Data/ProkaryoticVirus.fna -o ProkaryoticVirus -l 1 2 3 4
