#!/usr/bin/env Rscript

library(plyr)
library(ggplot2)

args = commandArgs(trailingOnly=TRUE)

#SETWD: Location of centrifuge_report.tsv files. Should all be in same directory
setwd(args[1])

#OUTPUT Directory: Location to store bubble plot and summary data file
out.dir <- args[2]

temp = list.files(pattern="*report.tsv")
myfiles = lapply(temp, read.delim)
sample_names <- as.list(sub("-centrifuge_report.tsv", "", temp))
myfiles = Map(cbind, myfiles, sample = sample_names)

#Filter settings, default is to remove human and synthetic constructs
filter <- llply(myfiles, subset, name != "Homo sapiens")
filter2 <- llply(filter, subset, name != "synthetic construct")

#Proportion calculations: Each species "Number of Unique Reads" is divided by total "Unique Reads"
props = lapply(filter2, function(x) { 
    x$proportion <- (x$numUniqueReads / sum(x$numUniqueReads))
    return(x[,c("name","proportion","sample")])
})

#Final dataframe created for plotting, can change proportion value (Default 1%)
final <- llply(props, subset, proportion > 0.02)
df <- ldply(final, data.frame)

names(df) <- c("x", "Proportion", "z")

#SCATTER PLOT WITH POINT SIZE
#Set file name and bubble plot title. Stored in out.dir
file_name <- args[3]
plot_title <- args[4]

options(bitmapType='cairo')
png(filename=paste0(out.dir, paste0(file_name,".png")), width = 800, height = 800)
p2 <- ggplot(df, aes(as.factor(z), as.factor(x))) + geom_point(aes(size = Proportion))
p2 <- p2 + theme(text = element_text(size=20), axis.text.x = element_text(angle = 90, hjust = 1))
p2 <- p2 + labs(y = "Organism", x = "Sample")
p2 <- p2 + ggtitle(plot_title) + theme(plot.title = element_text(hjust = 0.5))
p2 <- p2 + guides(color=F)
print(p2)
dev.off()

write.csv(df, file = paste0(out.dir, file_name, ".csv"))

