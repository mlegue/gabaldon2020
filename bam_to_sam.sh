#!/bin/bash
#SBATCH --job-name=CELE_bam_to_sam
#SBATCH --mem-per-cpu=5G
#SBATCH -n 6
#SBATCH -c 2
#SBATCH --output=CELE_sam_output.txt
#SBATCH --error=CELE_sam_error.txt

module load SAMtools

mkdir samfiles

for sample in *.bam
do
samtools view -h $sample > ./samfiles/$sample.sam
done
