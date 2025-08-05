#!/bin/bash
#SBATCH --partition=cpu
#SBATCH --exclusive
#SBATCH --time=144:00:00
#SBATCH --job-name=WIsH
#SBATCH --output=WIsH.out





source activate phabox2
# RefSeq-VHDB
phabox2 --contigs ../Data/ProkaryoticVirus.fna --task cherry -d ~/phabox_db_v2_1/ -o ProkaryoticVirus --threads 40

# MetaHiC
phabox2 --contigs ../Data/HiC/gut/virus.fa --task cherry -d ~/phabox_db_v2_1/ -o gut --bfolder ../Data/HiC/gut/MAGs --magonly Y --threads 40
phabox2 --contigs ../Data/HiC/water/virus.fa --task cherry -d ~/phabox_db_v2_1/ -o water --bfolder ../Data/HiC/water/MAGs --magonly Y --threads 40
phabox2 --contigs ../Data/HiC/cow/virus.fa --task cherry -d ~/phabox_db_v2_1/ -o cow --bfolder ../Data/HiC/cow/MAGs --magonly Y --threads 40