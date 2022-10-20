#!/bin/bash
#SBATCH -p short -N 1 -n 16 --mem 16gb --out logs/mpileup.log

module load samtools

mkdir bedfiles
mkdir result

samtools mpileup ref_aln/HR1.all.cram --output bedfiles/HR1.bam

awk '{print $1,$2,$4}' bedfiles/HR1.bam > result/HR1.bed
