#!/bin/bash
#SBATCH --partition=cpu
#SBATCH --exclusive
#SBATCH --time=144:00:00
#SBATCH --job-name=pheri
#SBATCH --output=pheri.out




source activate pheri
mkdir ProkaryoticVirus
# RefSeq-VHDB
## need to split the input file into one sequence per file
python pheri.py --indir ../Data/ProkaryoticVirus/ --outdir ProkaryoticVirus/
