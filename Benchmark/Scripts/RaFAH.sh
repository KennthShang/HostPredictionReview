#!/bin/bash
#SBATCH --partition=cpu
#SBATCH --exclusive
#SBATCH --time=144:00:00
#SBATCH --job-name=RaFAH
#SBATCH --output=RaFAH.out





source activate root

# RefSeq-VHDB
perl RaFAH.pl --predict --genomes_dir ../Data/ProkaryoticVirus/ --extension .fa --file_prefix Output/RaFAH
