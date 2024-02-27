#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 1

module load miniconda3
conda activate metagenomics

/usr/bin/time -v samtools view -b -o Hjor_mapped.bam Hjor_mapped.sam
/usr/bin/time -v samtools sort -o Hjor_mapped_sorted.bam Hjor_mapped.bam
/usr/bin/time -v samtools index Hjor_mapped_sorted.bam
