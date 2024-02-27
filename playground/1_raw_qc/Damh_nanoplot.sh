#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 10

module load miniconda3
conda activate metagenomics

/usr/bin/time -v NanoPlot -t $NSLOTS --fastq ../0_raw/rescued_SRR11673983_1.fastq.gz --plots dot --legacy dot --N50 -o Damh_nanoplot
