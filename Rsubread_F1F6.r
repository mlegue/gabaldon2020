#!/bin/bash
#SBATCH --job-name=CELE_Rsubread
#SBATCH --mem-per-cpu=5G
#SBATCH -n 6
#SBATCH -c 2
#SBATCH --output=CELE_Rsubread_output.txt
#SBATCH --error=CELE_Rsubread_error.txt

module load R/3.4.0

library(Rsubread)

# set origin
fastq.trim.files <- list.files(path = "./Cutadapted", pattern = ".fastq.gz$", full.names = TRUE)
origin <- fastq.trim.files

# build an small-RNA index using ensembl c_elegans.PRJNA13758.WS267.genomic.fa
mkdir indexR 
buildindex(basename="./reference_index",reference=ref)

# align the sample read data provided in this packge to the sample reference
# and save the mapping results to the current directory
reads <- system.file("extdata","reads.txt.gz",package="Rsubread")
align(index="./reference_index",readfile1=reads,output_file="./Rsubread_alignment.BAM")

# get the percentage of successfully mapped reads
propmapped("./Rsubread_alignment.BAM")


bam.files <- list.files(path = "./Unsorted", pattern = ".bam$", full.names = TRUE


