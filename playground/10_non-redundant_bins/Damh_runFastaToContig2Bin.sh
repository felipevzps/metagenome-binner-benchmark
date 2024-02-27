#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 1

module load miniconda3
conda activate metagenomics

mkdir Damh_sample_data

# Converting MetaBAT2 fasta output into tab separated contigs2bin file
/usr/bin/time -v Fasta_to_Contig2Bin.sh -i ../9_genome_binning/MetaBAT2/Damh_bins -e fa > Damh_sample_data/MetaBAT2.contigs2bin.tsv

# Converting MaxBin fasta output into tab separated contigs2bin file
/usr/bin/time -v Fasta_to_Contig2Bin.sh -i ../9_genome_binning/MaxBin2/Damh_bins -e fasta > Damh_sample_data/MaxBin2.contigs2bin.tsv

# Converting CONCOCT fasta output into tab separated contigs2bin file
/usr/bin/time -v perl -pe "s/,/\tCONCOCT./g;" ../9_genome_binning/CONCOCT/Damh_concoct_output/clustering_merged.csv > Damh_sample_data/CONCOCT.contigs2bin.tsv
