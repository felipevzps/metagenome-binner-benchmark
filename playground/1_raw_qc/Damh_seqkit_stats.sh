#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 10

module load miniconda3
conda activate metagenomics

/usr/bin/time -v seqkit stats ../0_raw/rescued_SRR11673983_1.fastq.gz --threads $NSLOTS
