#!/bin/bash

###MODIFIED to use the fancy-shmancy singularity container system#####
export SING_IMG="/rsgrps/bhurwitz/scottdaniel/singularity-images"
export SING_WD="/work"
export SING_CENTDIR="/centdb"

#Establish current working directory
export CWD=$PWD

#Directory where scripts are located
export SCRIPT_DIR="$CWD/scripts"

#Centrifuge Database Name ... up to but not including the ".1.cf"
export HPC_CENT_DB="/rsgrps/bhurwitz/jetjr/cent-db/comprehensive/bvf"
export CENT_DB="$SING_CENTDIR/bvf"

#Directory containing FASTA/Q files (Centrifuge ran on these files)
export HPC_WORK_DIR="/rsgrps/bhurwitz/hurwitzlab/data/raw/Doetschman_20111007/human/sra"
#this is the dir that will be bound to /work
export FASTA_DIR="$SING_WD/trimmed"

#Single or Paired End Reads? (single || paired)
#IMPORTANT: For paired end files see README.md for additional information
export TYPE="paired"

#FASTA/Q File Extension (common extensions include fasta, fa, fastq, fastq)
#DO NOT INCLUDE the dot "."
#xamples : SRR1592394_1_val_1.fq.gz, SRR1592394_2_val_2.fq.gz
export FILE_EXT="fq.gz"

#Centrifuge Report Out Directory
export REPORT_DIR="$SING_WD/cfuge"

#Bubble Plot Out Directory
#IMPORTANT NOTE: Make sure to include the '/' at the end of the path to satisfy R
export PLOT_OUT="$REPORT_DIR/plot/"

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
