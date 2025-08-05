#!/bin/bash
#SBATCH --partition=cpu
#SBATCH --exclusive
#SBATCH --time=144:00:00
#SBATCH --job-name=iphop
#SBATCH --output=iphop.out






source activate iphop_env
# RefSeq-VHDB
iphop predict --fa_file ../Data/ProkaryoticVirus.fna --db_dir iphop_db/Aug_2023_pub_rw/ --out_dir ProkaryoticVirus


# MetaHiC
## GTDB-Tk
gtdbtk de_novo_wf --genome_dir ../Data/HiC/gut/MAGs/ --archaea --outgroup_taxon p__Altiarchaeota --out_dir gut_db --cpus 40 --force --extension fa
gtdbtk de_novo_wf --genome_dir ../Data/HiC/cow/MAGs/ --archaea --outgroup_taxon p__Altiarchaeota --out_dir cow_db --cpus 40 --force --extension fa
gtdbtk de_novo_wf --genome_dir ../Data/HiC/water/MAGs/ --archaea --outgroup_taxon p__Altiarchaeota --out_dir water_db --cpus 40 --force --extension fa

## add to iphop database
iphop add_to_db --fna_dir ../Data/HiC/cow/MAGs/ --gtdb_dir cow_db --out_dir cow_db_final --db_dir iphop_db/Aug_2023_pub_rw/
iphop add_to_db --fna_dir ../Data/HiC/water/MAGs/ --gtdb_dir water_db --out_dir water_db_final --db_dir iphop_db/Aug_2023_pub_rw/
iphop add_to_db --fna_dir ../Data/HiC/gut/MAGs/ --gtdb_dir gut_db --out_dir gut_db_final --db_dir iphop_db/Aug_2023_pub_rw/

## Predict hosts
iphop predict --fa_file ../Data/HiC/cow/virus.fa --db_dir cow_db_final/ --out_dir hic_cow
iphop predict --fa_file ../Data/HiC/gut/virus.fa --db_dir gut_db_final/ --out_dir hic_gut
iphop predict --fa_file ../Data/HiC/water/virus.fa --db_dir water_db_final/ --out_dir hic_water