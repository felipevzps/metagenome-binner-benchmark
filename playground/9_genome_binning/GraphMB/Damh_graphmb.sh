#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 10

module load miniconda3
conda activate metagenomics

Damh=`ls -1 ../../5_assembly/Damh/assembly.fasta`
Damh_depth=`ls -1 ../MetaBAT2/Damh_depth.txt`

/usr/bin/time -v graphmb --assembly $Damh --outdir Damh_bins/ --assembly_name assembly.fasta --graph_file assembly_graph.gfa --depth $Damh_depth --numcores $NSLOTS
