#!/bin/bash
#SBATCH --job-name=CELE_bam_sort
#SBATCH --mem-per-cpu=5G
#SBATCH -n 6
#SBATCH -c 2
#SBATCH --output=CELE_bam_output.txt
#SBATCH --error=CELE_bam_error.txt

module load SAMtools

mkdir samfiles

for sample in *.bam
do
samtools view -h $sample > ./samfiles/$sample.sam
done
