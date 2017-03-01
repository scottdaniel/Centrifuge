#!/bin/bash

#Establish current working directory
export CWD=$PWD

#Directory where scripts are located
export SCRIPT_DIR="$CWD/scripts"

#Centrifuge Database Location
export CENT_DB="/rsgrps/bh_class/b_compressed+h+v/b_compressed+h+v"

#Directory containing FASTA/Q files (Centrifuge ran on these files)
export FASTA_DIR="/rsgrps/bhurwitz/jetjr/THS/reads"

#Single or Paired End Reads? (single || paired)
#IMPORTANT: For paired end files see README.md for additional information
export TYPE="single"

#FASTA/Q File Extension (common extensions include fasta, fa, fastq, fastq)
#DO NOT INCLUDE the dot "."
export FILE_EXT="fasta"

#Centrifuge Report Out Directory
export REPORT_DIR="$CWD/reports"

#Bubble Plot Out Directory
export PLOT_OUT="$CWD/plots/"

#Plot file name and title
export PLOT_FILE="bubble"
export PLOT_TITLE='Dermatitis_Example_Plot'

#File type (Fasta or Fastq | fasta = f; fastq = q)
export FILE_TYPE="f"

#Standard Error/Out Directory
export STDERR_DIR="$CWD/std-err"
export STDOUT_DIR="$CWD/std-out"
