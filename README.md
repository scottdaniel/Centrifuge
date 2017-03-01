# Centrifuge
Run Centrifuge on metagenomic samples and generate bubble plot visualizations.

QUICKSTART:

1. Edit config.sh
2. ./submit.sh


Edit the variables found in config.sh. Here is a description of each:

- Leave these two the same
export CWD=$PWD
export SCRIPT_DIR="CWD/scripts"

-State where the Centrifuge Database is located. Default for Hurwitz Lab
export CENT_DB="/rsgrps/bh_class/b_compressed+h+v/b_compressed+h+v"

-Directory with sample FASTA/Q files
export FASTA_DIR="/path/to/your/fasta/files"

-Single or Paired End? More information on paired end data below
export TYPE="paired"
or
export TYPE="single"

-FASTA/Q File Extension excluding the dot
export FILE_EXT="fq" 
or 
export FILE_EXT="fastq"
or
export FILE_EXT="fa"
etc...

-Report Directory is for Centrifuge Output and will be used for the generation of bubble plots

export REPORT_DIR="/centrifuge/output/reports"

-The output directory for the bubble plot
export PLOT_OUT="/plot/goes/here"

-Plot file name is the name of the file and will be placed in the PLOT_OUT directory. Only edit the actual title and do not include an extension
export PLOT_FILE="$PLOT_OUT"/bubble

-Plot title is the actual title found on the plot
export PLOT_TITLE="MY BUBBLE PLOT"

-File type is either "f" for fasta format or "q" for fastq format
export FILE_TYPE="q"

# Paired End Files
If you are using paired-end files you also must edit the script centrifuge_paired_tax.sh

The Centrifuge command looks like this in the script:

centrifuge -x $CENT_DB -1 $FASTA.paired.1.fastq -2 $FASTA.paired.2.fastq -U $FASTA.singletons.fastq -S $REPORT_DIR/$FASTA-centrifuge_hits.tsv --report-file $REPORT_DIR/$FASTA-centrifuge_report.tsv -$FILE_TYPE

-1 is the forward reads, -2 is the reverse, and -U is single reads. You must change the naming scheme of the paired end files. In this example the paired end files use paired.1.fastq for forward and paired.2.fastq for the reverse. A file of single reads singletons.fastq is also inputted. If you do not have single reads to accompany the paired end make sure to remove the -U option. 

# Editing the centrifuge_bubble.R
This script is written to exclude Homo sapiens and Synthetic Construct classfications. This is performed in the centrifuge_bubble.R script in the following code (line 19):

filter <- llply(myfiles, subset, name != "Homo sapiens")
filter2 <- llply(filter, subset, name != "synthetic construct")

This can be changed to filter any species and will not be used in the proportional classification calculations. Just notice that each subsequent filter should use the previous dataset to subset. So for example if I want to add a third filter for E. coli it would look like:

filter3 <- llply(filter2, subset, name != "Escherichia coli")

and I must aslo change the props object to include the most recent filter (line 23):

props = llaply(filter3, .....)

Included in the script is a subset that only includes classifications reaching a specific threshold with the default being 1% (line 29). Simply change the proportion > 0.01 to whatever value you desire. Often it is necessary to increase this value if too many species are classified at the 1% level. 

It's likely that the image dimensions and/or text size will need to be adjusted in order to create the perfect plot:

Image Dimensions (line 41):
png(filename=paste0(out.dir, paste0(file_name,".png")), width = 800, height = 800)

Axis Text Size (43):
p2 <- p2 + theme(text = element_text(size=20), axis.text.x = element_text(angle = 90, hjust = 1)) 
