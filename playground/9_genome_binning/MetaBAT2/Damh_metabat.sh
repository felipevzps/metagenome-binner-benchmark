#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 10

module load miniconda3
conda activate metagenomics

Damh=`ls -1 ../../5_assembly/Damh/assembly.fasta`

mkdir Damh_bins
/usr/bin/time -v metabat2 -i $Damh -a Damh_depth.txt -o Damh_bins/bins -t $NSLOTS
