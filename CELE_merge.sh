#!/bin/bash
#SBATCH --job-name=CELE_merge
#SBATCH --mem-per-cpu=5G
#SBATCH -n 6
#SBATCH -c 2
#SBATCH --output=CELE_merge_output.txt
#SBATCH --error=CELE_merge_error.txt

module load SAMtools

samtools merge OP50postPAO1_F4_R1_seq1.bam sorted_unsorted_CELE_mapped_trimmed_GM1541-10_S14_L00?_R1_001.fastq.gz.bam.bam
samtools merge OP50postPAO1_F4_R1_seq3.bam sorted_unsorted_CELE_mapped_trimmed_GM1541-10_S1_L00?_R1_seq3.fastq.gz.bam.bam
samtools merge OP50postPAO1_F4_R2_seq1.bam sorted_unsorted_CELE_mapped_trimmed_GM1541-11_S12_L00?_R1_001.fastq.gz.bam.bam
samtools merge OP50postPAO1_F4_R2_seq3.bam sorted_unsorted_CELE_mapped_trimmed_GM1541-11_S2_L00?_R1_seq3.fastq.gz.bam.bam
samtools merge OP50postPAO1_F4_R3_seq3.bam sorted_unsorted_CELE_mapped_trimmed_GM1541-12_S3_L00?_R1_seq3.fastq.gz.bam.bam
samtools merge OP50postPAO1_F4_R3_seq1.bam sorted_unsorted_CELE_mapped_trimmed_GM1541-12_S8_L00?_R1_001.fastq.gz.bam.bam
samtools merge PAO1_F5_R1_seq1.bam sorted_unsorted_CELE_mapped_trimmed_GM1541-13_S2_L00?_R1_001.fastq.gz.bam.bam
samtools merge PAO1_F5_R2_seq1.bam sorted_unsorted_CELE_mapped_trimmed_GM1541-14_S3_L00?_R1_001.fastq.gz.bam.bam
samtools merge PAO1_F5_R2_seq3.bam sorted_unsorted_CELE_mapped_trimmed_GM1541-14_S4_L00?_R1_seq3.fastq.gz.bam.bam
samtools merge PAO1_F5_R3_seq3.bam sorted_unsorted_CELE_mapped_trimmed_GM1541-15_S5_L00?_R1_seq3.fastq.gz.bam.bam
samtools merge PAO1_F5_R3_seq1.bam sorted_unsorted_CELE_mapped_trimmed_GM1541-15_S7_L00?_R1_001.fastq.gz.bam.bam
samtools merge PAO1_F6_R1_seq1.bam sorted_unsorted_CELE_mapped_trimmed_GM1541-16_S5_L00?_R1_001.fastq.gz.bam.bam
samtools merge PAO1_F6_R2_seq1.bam sorted_unsorted_CELE_mapped_trimmed_GM1541-17_S17_L00?_R1_001.fastq.gz.bam.bam
samtools merge PAO1_F6_R2_seq3.bam sorted_unsorted_CELE_mapped_trimmed_GM1541-17_S6_L00?_R1_seq3.fastq.gz.bam.bam
samtools merge PAO1_F6_R3_seq1.bam sorted_unsorted_CELE_mapped_trimmed_GM1541-18_S16_L00?_R1_001.fastq.gz.bam.bam
samtools merge PAO1_F6_R3_seq3.bam sorted_unsorted_CELE_mapped_trimmed_GM1541-18_S7_L00?_R1_seq3.fastq.gz.bam.bam
samtools merge OP50_control_R1_seq1.bam sorted_unsorted_CELE_mapped_trimmed_GM1541-19_S18_L00?_R1_001.fastq.gz.bam.bam
samtools merge PAO1_F1_R1_seq1.bam sorted_unsorted_CELE_mapped_trimmed_GM1541-1_S20_L00?_R1_001.fastq.gz.bam.bam
samtools merge OP50_control_R2_seq1.bam sorted_unsorted_CELE_mapped_trimmed_GM1541-20_S1_L00?_R1_001.fastq.gz.bam.bam
samtools merge OP50_control_R3_seq1.bam sorted_unsorted_CELE_mapped_trimmed_GM1541-21_S15_L00?_R1_001.fastq.gz.bam.bam
samtools merge OP50_control_R3_seq3.bam sorted_unsorted_CELE_mapped_trimmed_GM1541-21_S9_L00?_R1_seq3.fastq.gz.bam.bam
samtools merge PAO1_F1_R2_seq1.bam sorted_unsorted_CELE_mapped_trimmed_GM1541-2_S21_L00?_R1_001.fastq.gz.bam.bam
samtools merge PAO1_F1_R3_seq1.bam sorted_unsorted_CELE_mapped_trimmed_GM1541-3_S9_L00?_R1_001.fastq.gz.bam.bam
samtools merge PAO1_F2_R1_seq1.bam sorted_unsorted_CELE_mapped_trimmed_GM1541-4_S6_L00?_R1_001.fastq.gz.bam.bam
samtools merge PAO1_F2_R2_seq1.bam sorted_unsorted_CELE_mapped_trimmed_GM1541-5_S4_L00?_R1_001.fastq.gz.bam.bam
samtools merge PAO1_F2_R3_seq1.bam sorted_unsorted_CELE_mapped_trimmed_GM1541-6_S19_L00?_R1_001.fastq.gz.bam.bam
samtools merge OP50postPAO1_F3_R1_seq1.bam sorted_unsorted_CELE_mapped_trimmed_GM1541-7_S11_L00?_R1_001.fastq.gz.bam.bam
samtools merge OP50postPAO1_F3_R2_seq1.bam sorted_unsorted_CELE_mapped_trimmed_GM1541-8_S10_L00?_R1_001.fastq.gz.bam.bam
samtools merge OP50postPAO1_F3_R3_seq1.bam sorted_unsorted_CELE_mapped_trimmed_GM1541-9_S13_L00?_R1_001.fastq.gz.bam.bam

