#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 10

module load miniconda3
conda activate metagenomics

Damh=Damh/

/usr/bin/time -v graphmb --assembly $Damh --outdir Damh_bins/ --assembly_name assembly.fasta --graph_file assembly_graph.gfa --depth Damh_depth.txt --numcores $NSLOTS --contignodes --writebins
