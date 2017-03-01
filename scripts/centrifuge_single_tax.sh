#!/bin/bash

#PBS -W group_list=bhurwitz
#PBS -q windfall
#PBS -l select=1:ncpus=12:mem=23gb
#PBS -l pvmem=22gb
#PBS -l walltime=24:00:00
#PBS -l cput=24:00:00
#PBS -M jamesthornton@email.arizona.edu
#PBS -m bea

cd "$FASTA_DIR"
export FASTA_LIST="$FASTA_DIR/fasta-list"
ls *.$FILE_EXT | cut -d '.' -f 1 | uniq > $FASTA_LIST
echo "FASTA files to be processed:" $(cat $FASTA_LIST)

while read FASTA; do

  centrifuge -x $CENT_DB -U $FASTA.$FILE_EXT -S $REPORT_DIR/$FASTA-centrifuge_hits.tsv --report-file $REPORT_DIR/$FASTA-centrifuge_report.tsv -$FILE_TYPE

done < $FASTA_LIST

module load R/3.2.1

Rscript --vanilla $SCRIPT_DIR/centrifuge_bubble.R $REPORT_DIR $PLOT_OUT $PLOT_FILE $PLOT_TITLE
