#!/bin/bash

#Establish current working directory
export CWD=$PWD

#Directory where scripts are located
export SCRIPT_DIR="$CWD/scripts"

#Centrifuge Database Location
export CENT_DB="/rsgrps/bhurwitz/jetjr/cent-db/p_compressed+h+v"

#Directory containing FASTA/Q files (Centrifuge ran on these files)
export FASTA_DIR="/path/to/fasta"

#Single or Paired End Reads? (single || paired)
#IMPORTANT: For paired end files see README.md for additional information
export TYPE="single"

#FASTA/Q File Extension (common extensions include fasta, fa, fastq, fastq)
#DO NOT INCLUDE the dot "."
export FILE_EXT="fasta"

#Centrifuge Report Out Directory
export REPORT_DIR="/centrifuge/report/dir"

#Bubble Plot Out Directory
#IMPORTANT NOTE: Make sure to include the '/' at the end of the path to satisfy R
export PLOT_OUT="/plot/out/dir"

#Plot file name and title (No spaces, use _)
export PLOT_FILE="file_name"
export PLOT_TITLE='plot_title'

#File type (Fasta or Fastq | fasta = f; fastq = q)
export FILE_TYPE="f"

#Exclude hits by stating taxid in following format ("taxid1,taxid2")
export EXCLUDE=""

#Standard Error/Out Directory
export STDERR_DIR="$CWD/std-err"
export STDOUT_DIR="$CWD/std-out"
