#!/bin/bash

#SBATCH --job-name=run_qcore
#SBATCH --output=run_qcore.out
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=5
#SBATCH --time=0-01:00:00

pwd

export MKL_THREADING_LAYER=TBB
export OMP_NUM_THREADS=1

for i in ../xyzs/*.xyz; do
	file_name=$(basename ${i})
	~/.local/src/Qcore/release/bin/qcore -s "res := xtb(structure(file = '${i}') model='chlorophyll') print(load = res variable = shell_resolved_partial_charges)" > ~/bchla_initial_guess/outputs/${file_name/.xyz/.out}
done
