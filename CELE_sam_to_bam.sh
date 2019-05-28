#!/bin/bash
#SBATCH --job-name=CELE_bam_sort
#SBATCH --mem-per-cpu=5G
#SBATCH -n 6
#SBATCH -c 2
#SBATCH --output=CELE_bam_output.txt
#SBATCH --error=CELE_bam_error.txt

module load SAMtools

for file in CELE_mapped*
do 
samtools view -b -h | samtools sort - > sorted_$file.bam
done

$mkdir merged

for L1 in sorted_*_L001_*.bam
do
    echo $L1
    L2=`echo $L1 | sed 's/_L001_/_L002_/'`
    L3=`echo $L1 | sed 's/_L001_/_L003_/'`
    L4=`echo $L1 | sed 's/_L001_/_L004_/'`
    merged=`echo $L1 | sed 's/_L001_/_merged_/'`
    samtools merge ./merged/${merged} ${L1} ${L2} ${L3} ${L4}
done
