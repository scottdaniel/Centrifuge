#!/bin/bash

#Establish current working directory
export CWD=$PWD

#Directory where scripts are located
export SCRIPT_DIR="$CWD/scripts"

#Centrifuge Database Location
export CENT_DB="/rsgrps/bhurwitz/jetjr/cent-db/comprehensive"

#Directory containing FASTA/Q files (Centrifuge ran on these files)
export FASTA_DIR="/rsgrps/bhurwitz/hurwitzlab/data/raw/Doetschman_20111007/human/sra"

#Single or Paired End Reads? (single || paired)
#IMPORTANT: For paired end files see README.md for additional information
export TYPE="paired"

#FASTA/Q File Extension (common extensions include fasta, fa, fastq, fastq)
#DO NOT INCLUDE the dot "."
export FILE_EXT="fastq.gz"

#Centrifuge Report Out Directory
export REPORT_DIR="/rsgrps/bhurwitz/hurwitzlab/data/raw/Doetschman_20111007/human/sra/cfuge"

#Bubble Plot Out Directory
#IMPORTANT NOTE: Make sure to include the '/' at the end of the path to satisfy R
export PLOT_OUT="/rsgrps/bhurwitz/hurwitzlab/data/raw/Doetschman_20111007/human/sra/cfuge/plot/"

#Plot file name and title (No spaces, use _)
export PLOT_FILE="HumanCRCbacteria"
export PLOT_TITLE="HumanCRCbacteria"

#File type (Fasta or Fastq | fasta = f; fastq = q)
export FILE_TYPE="q"

#Exclude hits by stating taxid in following format ("taxid1,taxid2")
#9606 is human
#32630 are synthetic contructs (e.g. random illumina hexamer primer)
export EXCLUDE="9606,32630"

#Standard Error/Out Directory
export STDERR_DIR="$CWD/std-err"
export STDOUT_DIR="$CWD/std-out"
