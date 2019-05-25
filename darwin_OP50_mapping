#!/bin/bash
#SBATCH --job-name=PAO_mapping 
#SBATCH --mem-per-cpu=5G
#SBATCH -n 6
#SBATCH -c 2
#SBATCH --output=OP50_output.txt
#SBATCH --error=OP50_error.txt

module load Bowtie2

for file in trimmed*; do bowtie2 -q --phred33 -N 0 -L 17 -i S,0,2.50 -x OP50_F1F6 -U $file -S OP50_mapped_$file; done