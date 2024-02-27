#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 10

module load miniconda3
conda activate metagenomics

/usr/bin/time -v NanoPlot -t $NSLOTS --fastq ../0_raw/SRR11673974_1.fastq.gz --plots dot --legacy dot --N50 -o Hjor_nanoplot
