#!/bin/bash
#SBATCH --job-name=CELE_merge
#SBATCH --mem-per-cpu=5G
#SBATCH -n 6
#SBATCH -c 2
#SBATCH --output=CELE_merge_output.txt
#SBATCH --error=CELE_merge_error.txt

module load SAMtools

for file in CELE_mapped*
do 
samtools view -bS $file | samtools sort - sorted_$file.bam
done
