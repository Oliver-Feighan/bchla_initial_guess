#!/bin/bash

#SBATCH --job-name=run_qcore
#SBATCH --output=run_qcore.out
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=5
#SBATCH --time=0-01:00:00

export MKL_THREADING_LAYER=TBB
export OMP_NUM_THREADS=1

for i in ../xyzs/*.xyz; do
	echo ${i};
done
