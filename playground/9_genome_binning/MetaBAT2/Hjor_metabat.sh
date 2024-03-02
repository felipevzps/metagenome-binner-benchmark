#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 5

module load miniconda3
conda activate metagenomics

Hjor=`ls -1 ../../5_assembly/Hjor/assembly.fasta`

mkdir Hjor_bins
/usr/bin/time -v metabat2 -i $Hjor -a Hjor_depth.txt -o Hjor_bins/bins -t $NSLOTS
