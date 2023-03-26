git pull --recurse-submodules
git submodule update --recursive --remote
sbatch submit-NeSI.sh
squeue -u username