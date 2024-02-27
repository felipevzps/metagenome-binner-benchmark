#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 10

module load miniconda3
conda activate metagenomics

mkdir soft_filter
/usr/bin/time -v porechop -i ../2_trimmed/soft_filter/SRR11673974_1.trimmed.highquality.fastq -o soft_filter/SRR11673974_1.trimmed.highquality.noadapter.fastq --threads $NSLOTS
