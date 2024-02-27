#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 10

module load miniconda3
conda activate metagenomics

Hjor=`ls -1 ../../5_assembly/Hjor/assembly.fasta`
Hjor_depth=`ls -1 ../MetaBAT2/Hjor_depth.txt`

/usr/bin/time -v graphmb --assembly $Hjor --outdir Hjor_bins/ --assembly_name assembly.fasta --graph_file assembly_graph.gfa --depth $Hjor_depth --numcores $NSLOTS
