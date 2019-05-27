#!/bin/bash
#SBATCH --job-name=CELE_count
#SBATCH --mem-per-cpu=5G
#SBATCH -n 6
#SBATCH -c 2
#SBATCH --output=CELE_count_output.txt
#SBATCH --error=CELE_count_error.txt

module load HTSeq

 for sample in *.bam
 do
   htseq-count -f bam -s no -m intersection-nonempty $sample CELE_gff.gff > count_$sample.count
 done