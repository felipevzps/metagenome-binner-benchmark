#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 10

module load miniconda3
conda activate metagenomics

Damh=`ls -1 ../../5_assembly/Damh/assembly.fasta`
Damh_depth=`ls -1 ../MetaBAT2/Damh_depth.txt`

mkdir Damh_bins
/usr/bin/time -v run_MaxBin.pl -contig $Damh -abund $Damh_depth -out Damh_bins/bins -thread $NSLOTS
