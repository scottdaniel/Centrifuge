#!/bin/bash

#PBS -W group_list=bhurwitz
#PBS -q standard
#PBS -l select=1:ncpus=12:mem=23gb
#PBS -l pvmem=22gb
#PBS -l walltime=24:00:00
#PBS -l cput=24:00:00
#PBS -M jamesthornton@email.arizona.edu
#PBS -m bea

cd "$FASTA_DIR"
export FASTA_LIST="$REPORT_DIR/fasta-list"
ls *.$FILE_EXT | uniq > $FASTA_LIST
echo "FASTA files to be processed:" $(cat $FASTA_LIST)

while read FASTA; do
  FILE_NAME=$(basename $FASTA | cut -d '.' -f 1)
  centrifuge -x $CENT_DB -U $FASTA -S $REPORT_DIR/$FILE_NAME-centrifuge_hits.tsv --report-file $REPORT_DIR/$FILE_NAME-centrifuge_report.tsv -$FILE_TYPE --exclude-taxids $EXCLUDE

done < $FASTA_LIST

module load unsupported
module load markb/R/3.1.1

$SCRIPT_DIR/centrifuge_bubble.R -d $REPORT_DIR -o $PLOT_OUT -f $PLOT_FILE -t $PLOT_TITLE

