#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 10

module load miniconda3
conda activate metagenomics

# remove wrong read - 
/usr/bin/time -v seqkit sana SRR11673983_1.fastq.gz --compress-level 5 --threads $NSLOTS -o rescued_SRR11673983_1.fastq.gz
