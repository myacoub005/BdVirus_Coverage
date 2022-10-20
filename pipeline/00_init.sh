#!/usr/bin/bash
#SBATCH -p short -N 1 -n 16 --mem 16gb --out logs/init.log

module load samtools

samtools faidx genomes/Batrachochytrium_dendrobatidis_CLFT044.scaffolds.fa

cd genomes
 awk 'BEGIN{OFS="\t"} {print $1,'1',$2}' Batrachochytrium_dendrobatidis_CLFT044.scaffolds.fa.fai | sort > chroms.bed
