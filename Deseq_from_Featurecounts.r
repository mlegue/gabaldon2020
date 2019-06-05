#Alternatively, the function DESeqDataSetFromMatrix can be used if you already have a matrix of read counts prepared from another source. Another method for quickly producing count matrices from alignment files is the featureCounts function (Liao, Smyth, and Shi 2013) in the Rsubread package. To use DESeqDataSetFromMatrix, the user should provide the counts matrix, the information about the samples (the columns of the count matrix) as a DataFrame or data.frame, and the design formula.
#To demonstate the use of DESeqDataSetFromMatrix, we will read in count data from the pasilla package. We read in a count matrix, which we will name cts, and the sample information table, which we will name coldata. Further below we describe how to extract these objects from, e.g. featureCounts output.

library("pasilla")
pasCts <- system.file("extdata",
                      "pasilla_gene_counts.tsv",
                      package="pasilla", mustWork=TRUE)
pasAnno <- system.file("extdata",
                       "pasilla_sample_annotation.csv",
                       package="pasilla", mustWork=TRUE)
cts <- as.matrix(read.csv(pasCts,sep="\t",row.names="gene_id"))
coldata <- read.csv(pasAnno, row.names=1)
coldata <- coldata[,c("condition","type")]

#We examine the count matrix and column data to see if they are consistent in terms of sample order.

head(cts,2)

coldata

Note that these are not in the same order with respect to samples!

It is absolutely critical that the columns of the count matrix and the rows of the column data (information about samples) are in the same order. DESeq2 will not make guesses as to which column of the count matrix belongs to which row of the column data, these must be provided to DESeq2 already in consistent order.

As they are not in the correct order as given, we need to re-arrange one or the other so that they are consistent in terms of sample order (if we do not, later functions would produce an error). We additionally need to chop off the "fb" of the row names of coldata, so the naming is consistent.

rownames(coldata) <- sub("fb", "", rownames(coldata))
all(rownames(coldata) %in% colnames(cts))

## [1] TRUE

all(rownames(coldata) == colnames(cts))

## [1] FALSE

cts <- cts[, rownames(coldata)]
all(rownames(coldata) == colnames(cts))

## [1] TRUE

If you have used the featureCounts function (Liao, Smyth, and Shi 2013) in the Rsubread package, the matrix of read counts can be directly provided from the "counts" element in the list output. The count matrix and column data can typically be read into R from flat files using base R functions such as read.csv or read.delim. For htseq-count files, see the dedicated input function below.

With the count matrix, cts, and the sample information, coldata, we can construct a DESeqDataSet:

library("DESeq2")
dds <- DESeqDataSetFromMatrix(countData = cts,
                              colData = coldata,
                              design = ~ condition)
dds

## class: DESeqDataSet 
## dim: 14599 7 
## metadata(1): version
## assays(1): counts
## rownames(14599): FBgn0000003 FBgn0000008 ... FBgn0261574
##   FBgn0261575
## rowData names(0):
## colnames(7): treated1 treated2 ... untreated3 untreated4
## colData names(2): condition type

If you have additional feature data, it can be added to the DESeqDataSet by adding to the metadata columns of a newly constructed object. (Here we add redundant data just for demonstration, as the gene names are already the rownames of the dds.)

featureData <- data.frame(gene=rownames(cts))
mcols(dds) <- DataFrame(mcols(dds), featureData)
mcols(dds)

## DataFrame with 14599 rows and 1 column
##                    gene
##                <factor>
## FBgn0000003 FBgn0000003
## FBgn0000008 FBgn0000008
## FBgn0000014 FBgn0000014
## FBgn0000015 FBgn0000015
## FBgn0000017 FBgn0000017
## ...                 ...
## FBgn0261571 FBgn0261571
## FBgn0261572 FBgn0261572
## FBgn0261573 FBgn0261573
## FBgn0261574 FBgn0261574
## FBgn0261575 FBgn0261575

htseq-count input

You can use the function DESeqDataSetFromHTSeqCount if you have used htseq-count from the HTSeq python package (Anders, Pyl, and Huber 2014). For an example of using the python scripts, see the pasilla data package. First you will want to specify a variable which points to the directory in which the htseq-count output files are located.

directory <- "/path/to/your/files/"

However, for demonstration purposes only, the following line of code points to the directory for the demo htseq-count output files packages for the pasilla package.

directory <- system.file("extdata", package="pasilla",
                         mustWork=TRUE)

We specify which files to read in using list.files, and select those files which contain the string "treated" using grep. The sub function is used to chop up the sample filename to obtain the condition status, or you might alternatively read in a phenotypic table using read.table.

sampleFiles <- grep("treated",list.files(directory),value=TRUE)
sampleCondition <- sub("(.*treated).*","\\1",sampleFiles)
sampleTable <- data.frame(sampleName = sampleFiles,
                          fileName = sampleFiles,
                          condition = sampleCondition)

Then we build the DESeqDataSet using the following function:

library("DESeq2")
ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable,
                                       directory = directory,
                                       design= ~ condition)
ddsHTSeq

## class: DESeqDataSet 
## dim: 70463 7 
## metadata(1): version
## assays(1): counts
## rownames(70463): FBgn0000003:001 FBgn0000008:001 ...
##   FBgn0261575:001 FBgn0261575:002
## rowData names(0):
## colnames(7): treated1fb.txt treated2fb.txt ... untreated3fb.txt
##   untreated4fb.txt
## colData names(1): condition