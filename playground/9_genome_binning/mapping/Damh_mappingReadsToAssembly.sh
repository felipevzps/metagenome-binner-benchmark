#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 10

module load miniconda3
conda activate metagenomics

in=`ls -1 ../../3_adapter_removal/soft_filter/SRR11673983_1.trimmed.highquality.noadapter.fastq`
assembly=`ls -1 ../../5_assembly/Damh/assembly.fasta`

# Mapping reads to assembly
# Reformat long reads to max 600 length 

# trd: Trim the names of reads after the first whitespace
/usr/bin/time -v reformat.sh in=$in out=Damh_mapped_reads.fasta fastareadlen=600 trd
/usr/bin/time -v bbmap.sh ref=$assembly in=Damh_mapped_reads.fasta out=Damh_mapped.sam threads=$NSLOTS 
