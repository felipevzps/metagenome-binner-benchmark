#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 10

module load miniconda3
conda activate metagenomics

assembly=`ls -1 ../../5_assembly/Hjor/assembly.fasta`

# Cut contigs into smaller parts
/usr/bin/time -v cut_up_fasta.py $assembly -c 10000 -o 0 --merge_last -b Hjor_contigs_10K.bed > Hjor_contigs_10K.fa

# Generate table with coverage depth
/usr/bin/time -v concoct_coverage_table.py Hjor_contigs_10K.bed ../mapping/Hjor_mapped_sorted.bam > Hjor_coverage_table.tsv

# Run COCOCT
/usr/bin/time -v concoct --composition_file Hjor_contigs_10K.fa --coverage_file Hjor_coverage_table.tsv -b Hjor_concoct_output/ -t $NSLOTS

# Merge subcontig clustering into original contig clustering:
/usr/bin/time -v merge_cutup_clustering.py Hjor_concoct_output/clustering_gt1000.csv > Hjor_concoct_output/clustering_merged.csv

# Extract bins as individual FASTA
mkdir bins
/usr/bin/time -v extract_fasta_bins.py $assembly Hjor_concoct_output/clustering_merged.csv --output_path Hjor_bins

