#!/bin/bash
#SBATCH --job-name=CELE_mapping 
#SBATCH --mem-per-cpu=5G
#SBATCH -n 6
#SBATCH -c 2
#SBATCH --output=CELE_output.txt
#SBATCH --error=CELE_error.txt

module load Bowtie2

bowtie2-build -f c_elegans.PRJNA13758.WS267.genomic.fa CELE_F1F6

for file in trimmed*
do bowtie2 -q --phred33 -N 0 -L 17 -i S,0,2.50 -x CELE_F1F6 -U $file -S CELE_mapped_$file.sam
done

