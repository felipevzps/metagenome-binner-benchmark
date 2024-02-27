#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 10

module load miniconda3
conda activate metagenomics

assembly=`ls -1 ../../5_assembly/Damh/assembly.fasta`

# Cut contigs into smaller parts
/usr/bin/time -v cut_up_fasta.py $assembly -c 10000 -o 0 --merge_last -b Damh_contigs_10K.bed > Damh_contigs_10K.fa

# Generate table with coverage depth
/usr/bin/time -v concoct_coverage_table.py Damh_contigs_10K.bed ../mapping/Damh_mapped_sorted.bam > Damh_coverage_table.tsv

# Run COCOCT
/usr/bin/time -v concoct --composition_file Damh_contigs_10K.fa --coverage_file Damh_coverage_table.tsv -b Damh_concoct_output/ -t $NSLOTS

# Merge subcontig clustering into original contig clustering:
/usr/bin/time -v merge_cutup_clustering.py Damh_concoct_output/clustering_gt1000.csv > Damh_concoct_output/clustering_merged.csv

# Extract bins as individual FASTA
mkdir bins
/usr/bin/time -v extract_fasta_bins.py $assembly Damh_concoct_output/clustering_merged.csv --output_path Damh_bins

