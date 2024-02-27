#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 10

module load miniconda3
conda activate metagenomics

assembly=`ls -1 ../5_assembly/Damh/assembly.fasta`

mkdir Damh_output

/usr/bin/time -v DAS_Tool -i Damh_sample_data/MetaBAT2.contigs2bin.tsv,Damh_sample_data/MaxBin2.contigs2bin.tsv,Damh_sample_data/CONCOCT.contigs2bin.tsv -l MetaBAT2,MaxBin2,CONCOCT -c $assembly -o Damh_output/DASToolRun -t $NSLOTS --write_bin_evals --write_bins --score_threshold 0.5 
