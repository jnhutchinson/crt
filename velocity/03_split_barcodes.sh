#!/bin/bash

# https://slurm.schedmd.com/sbatch.html
# https://wiki.rc.hms.harvard.edu/display/O2

#SBATCH --partition=short        # Partition (queue) priority
#SBATCH --time=12:00:00              # Runtime in D-HH:MM format, 10:00:00 for hours
#SBATCH --job-name=split          # Job name
#SBATCH -c 1			    # cores
#SBATCH --mem=10G           # Memory needed per CPU or --mem-per-cpu
#SBATCH --output=project_%j.out     # File to which STDOUT will be written, including job ID
#SBATCH --error=project_%j.err      # File to which STDERR will be written, including job ID
#SBATCH --mail-type=ALL             # Type of email notification (BEGIN, END, FAIL, ALL)

date

source activate r

barcode_splitter --bcfile samples.tsv $1 $2 $3 $4 --idxread 3 --suffix .fq

source deactivate

date