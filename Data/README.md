# Computational approaches for virus-host prediction: A review of methods and applications

There are four datasets in this folder:

* CRISPRs: 2,005,489 CRISPRs derived from the prokaryotic genomes using CRT v1.2 
* tRNA: 7,709,234 tRNA genes derived from the prokaryotic genomes using ARAGORN
* RefSeq-VHDB: datasets used in the first benchmark
* MetaHic-VHDB: datasets used in the second benchmark

The datasets can be downloaded via: https://github.com/KennthShang/HostPredictionReview/releases


## Update of the datasets

The current version of RefSeq-VHDB was created in Feb 2025. We will update and release the RefSeq-VHDB yearly through the GitHub Release page.

For users who want to update the RefSeq-VHDB manually, please follow the instructions below:
1. Go to the [NCBI Virus Database](https://www.ncbi.nlm.nih.gov/labs/virus/vssi/#/virus?SeqType_s=Nucleotide&SourceDB_s=RefSeq&Completeness_s=complete&GenomeCompleteness_s=complete) and download all the records (both Fasta and CSV). Please note that we used filter "RefSeq = True",  "Assembly Completeness = True", and "Nucleotide Completeness = True" for high-quality sequences.
2. Launch Jupyter notebook and run the "Update_RefSeq_VHDB.ipynb" step-by-step to generate the RefSeq-VHDB file.
3. According to the new RefSeq-VHDB file, the last thing you need to do is to filter the Fasta records downloaded from the NCBI.
