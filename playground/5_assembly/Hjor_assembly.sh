#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 20

module load miniconda3
conda activate metagenomics

/usr/bin/time -v flye --meta --nano-hq ../3_adapter_removal/soft_filter/SRR11673974_1.trimmed.highquality.noadapter.fastq --out-dir Hjor --threads $NSLOTS
