#!/bin/bash

#Establish current working directory
export CWD=$PWD

#Directory where scripts are located
export SCRIPT_DIR="$CWD/scripts"

#Centrifuge Database Location
export CENT_DB="/rsgrps/bh_class/b_compressed+h+v/b_compressed+h+v"

#Directory containing FASTA/Q files (Centrifuge ran on these files)
export FASTA_DIR="/path/to/fasta"

#Single or Paired End Reads? (single || paired)
#IMPORTANT: For paired end files see README.md for additional information
export TYPE=""

#FASTA/Q File Extension (common extensions include fasta, fa, fastq, fastq)
#DO NOT INCLUDE the dot "."
export FILE_EXT=""

#Centrifuge Report Out Directory
export REPORT_DIR="/path/for/centrifuge/reports"

#Bubble Plot Out Directory
#IMPORTANT NOTE: Make sure to include the '/' at the end of the path to satisfy R
export PLOT_OUT="/path/for/bubble/plot/"

#Plot file name and title
export PLOT_FILE=""
export PLOT_TITLE=''

#File type (Fasta or Fastq | fasta = f; fastq = q)
export FILE_TYPE=""

#Exclude hits by stating species name in following format ("species 1,species 2")
export EXCLUDE=""

#Standard Error/Out Directory
export STDERR_DIR="$CWD/std-err"
export STDOUT_DIR="$CWD/std-out"
