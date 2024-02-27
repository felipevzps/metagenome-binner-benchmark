#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 10

module load miniconda3
conda activate metagenomics

/usr/bin/time -v seqkit stats ../3_adapter_removal/soft_filter/SRR11673983_1.trimmed.highquality.noadapter.fastq --threads $NSLOTS
