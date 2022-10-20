#!/bin/bash
#SBATCH -p short -N 1 -n 16 --mem 16gb --out logs/bedops.log

module load bedops

grep "scaffold_10" result/HR1.bed > result/HR1_int.bed
awk -vFS=" " -vOFS=" " '{ print $1, $2, ($2 + 1), ".", $3 }' result/HR1_int.bed > result/HR1_test.bed
bedops --merge result/HR1_test.bed | bedops --chop 100 - | bedmap --echo --mean --delim ' ' - result/HR1_test.bed > result/HR1_answer.bed
