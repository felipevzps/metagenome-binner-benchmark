#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 1

module load miniconda3
conda activate metagenomics

mkdir soft_filter
/usr/bin/time -v filtlong --min_length 1000  ../0_raw/rescued_SRR11673983_1.fastq.gz > soft_filter/SRR11673983_1.trimmed.fastq
