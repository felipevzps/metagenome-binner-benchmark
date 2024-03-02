#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 5

module load miniconda3
conda activate metagenomics

Hjor=`ls -1 ../../5_assembly/Hjor/assembly.fasta`
Hjor_depth=`ls -1 ../MetaBAT2/Hjor_depth.txt`

mkdir Hjor_bins
/usr/bin/time -v run_MaxBin.pl -contig $Hjor -abund $Hjor_depth -out Hjor_bins/bins -thread $NSLOTS
