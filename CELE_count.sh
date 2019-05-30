#!/bin/bash
#SBATCH --job-name=CELE_count
#SBATCH --mem-per-cpu=5G
#SBATCH -n 6
#SBATCH -c 2
#SBATCH --output=CELE_count_output.txt
#SBATCH --error=CELE_count_error.txt

module load HTSeq

mkdir counts 

 for sample in *.bam
 do
   htseq-count -f bam -s yes -m intersection-nonempty --order=pos -t sRNA $sample CELE_gff.gff > ./counts/$sample.count
 done