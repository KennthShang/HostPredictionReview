#!/bin/bash
#SBATCH --partition=cpu
#SBATCH --exclusive
#SBATCH --time=144:00:00
#SBATCH --job-name=WIsH
#SBATCH --output=WIsH.out





source activate WIsH
# MetaHiC
## need to split the input file into one sequence per file
WIsH/WIsH -c build -g ../Data/HiC/cow/MAGs -m cow
mkdir cow_out
WIsH/WIsH -c predict -g ../Data/HiC/cow/virus -m cow -o cow_out -b 1

WIsH/WIsH -c build -g ../Data/HiC/water/MAGs -m water
mkdir water_out
WIsH/WIsH -c predict -g ../Data/HiC/water/virus -m water -o water_out -b 1

WIsH/WIsH -c build -g ../Data/HiC/gut/MAGs -m gut
mkdir gut_out
WIsH/WIsH -c predict -g ../Data/HiC/gut/virus -m gut -o gut_out -b 1
