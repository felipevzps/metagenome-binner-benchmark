#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 1

module load miniconda3
conda activate metagenomics

/usr/bin/time -v samtools view -b -o Damh_mapped.bam Damh_mapped.sam
/usr/bin/time -v samtools sort -o Damh_mapped_sorted.bam Damh_mapped.bam
/usr/bin/time -v samtools index Damh_mapped_sorted.bam
