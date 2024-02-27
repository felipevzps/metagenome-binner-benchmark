#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 1

module load miniconda3
conda activate metagenomics

Hjor=`ls -1 ../mapping/Hjor_mapped_sorted.bam`

/usr/bin/time -v jgi_summarize_bam_contig_depths --outputDepth Hjor_depth.txt $Hjor
