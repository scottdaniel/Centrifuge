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

  centrifuge -x $CENT_DB -1 $FASTA.paired.1.fastq -2 $FASTA.paired.2.fastq -U $FASTA.singletons.fastq -S $REPORT_DIR/$FASTA-centrifuge_hits.tsv --report-file $REPORT_DIR/$FASTA-centrifuge_report.tsv -$FILE_TYPE --exclude-taxids $EXCLUDE

done < $FASTA_LIST

module load unsupported
module load markb/R/3.1.1

$SCRIPT_DIR/centrifuge_bubble.R -d $REPORT_DIR -o $PLOT_OUT -f $PLOT_FILE -t $PLOT_TITLE
