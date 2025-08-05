#!/bin/bash
#SBATCH --partition=cpu
#SBATCH --exclusive
#SBATCH --time=144:00:00
#SBATCH --job-name=php
#SBATCH --output=php.out





source activate php
# RefSeq-VHDB
## need to split the input file into one sequence per file
python PHP.py --virusFastaFileDir ../Data/ProkaryoticVirus --outFileDir ProkaryoticVirus --bacteriaKmerDir db --bacteriaKmerName hostKmer_60105_kmer4


# MetaHiC
## need to split the input file into one sequence per file
python countKmer.py --fastaFileDir ../Data/HiC/cow/MAGs --kmerFileDir cow --kmerName HostKmer --coreNum 40
python PHP.py --virusFastaFileDir ../Data/HiC/cow/virus --outFileDir cow --bacteriaKmerDir cow --bacteriaKmerName HostKmer

python countKmer.py --fastaFileDir ../Data/HiC/gut/MAGs --kmerFileDir gut --kmerName HostKmer --coreNum 40
python PHP.py --virusFastaFileDir ../Data/HiC/gut/virus --outFileDir gut --bacteriaKmerDir gut --bacteriaKmerName HostKmer

python countKmer.py --fastaFileDir ../Data/HiC/water/MAGs --kmerFileDir water --kmerName HostKmer --coreNum 40
python PHP.py --virusFastaFileDir ../Data/HiC/water/virus --outFileDir water --bacteriaKmerDir water --bacteriaKmerName HostKmer

