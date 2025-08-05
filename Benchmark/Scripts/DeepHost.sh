#!/bin/bash
#SBATCH --partition=cpu
#SBATCH --exclusive
#SBATCH --time=144:00:00
#SBATCH --job-name=deephost
#SBATCH --output=deephost.out





source activate deephost
# RefSeq-VHDB
python DeepHost.py ../Data/ProkaryoticVirus.fna --out ProkaryoticVirus --thread 40

