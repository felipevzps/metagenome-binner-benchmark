#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 1

module load miniconda3
conda activate metagenomics

Damh=`ls -1 ../mapping/Damh_mapped_sorted.bam`

/usr/bin/time -v jgi_summarize_bam_contig_depths --outputDepth Damh_depth.txt $Damh
