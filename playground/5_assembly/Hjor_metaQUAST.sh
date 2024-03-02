#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 10

module load miniconda3
conda activate metagenomics

/usr/bin/time -v metaquast.py -o Hjor_metaquast --threads $NSLOTS Hjor/assembly.fasta
