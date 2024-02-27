#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 1

module load miniconda3
conda activate metagenomics

#/usr/bin/time -v filtlong --min_length 1000 ../0_raw/SRR11673974_1.fastq.gz

/usr/bin/time -v filtlong --min_length 1000 ../0_raw/SRR11673974_1.fastq.gz > soft_filter/SRR11673974_1.trimmed.fastq
