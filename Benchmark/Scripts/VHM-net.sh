#!/bin/bash
#SBATCH --partition=cpu
#SBATCH --exclusive
#SBATCH --time=144:00:00
#SBATCH --job-name=vhm_net
#SBATCH --output=vhm_net.out





source /lustre/home/acct-weifengshi/weifengshi/software/miniconda3/bin/activate vhm_net
# RefSeq-VHDB
## need to split the input file into one sequence per file
python VirHostMatcher-Net.py -q ../Data/ProkaryoticVirus/ -o ProkaryoticVirus -i tmp -n 1 -t 40