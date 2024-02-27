#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 10

module load miniconda3
conda activate metagenomics

/usr/bin/time -v porechop -i ../2_trimmed/soft_filter/SRR11673983_1.trimmed.highquality.fastq -o soft_filter/SRR11673983_1.trimmed.highquality.noadapter.fastq --threads $NSLOTS
