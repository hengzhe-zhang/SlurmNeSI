# Slurm-NeSI

This is a simple Slurm script (`slurm-NeSI.sh`) that runs a Python script (`simple_task.py`) on a NeSI cluster. The Python script takes two arguments, `SLURM_ARRAY_TASK_ID` and `SLURM_ARRAY_TASK_STEP`, to determine which algorithm and dataset to use for each task.

## Usage

To use this script, you should modify `slurm-NeSI.sh` and `simple_task.py` to suit your needs. Specifically, you should modify:

- slurm-NeSI.sh
  - The range of array tasks to run (e.g. `-a 0-10:10` runs tasks 0 to 10 with a step size of 10)
  - The number of CPUs to allocate per task (e.g. `--cpus-per-task=10`)
  - The amount of memory to allocate per task (e.g. `--mem=10GB`)
  - The maximum time to run each task (e.g. `--time=0-65:00`)
  - The email notifications to receive for each task (e.g. `--mail-type=ALL`)
  - The output and error log file paths (e.g. `--output=log/R-%x.%j-%a.out` and `--error=log/R-%x.%j-%a.err`)
  - The command to run the Python script (`python3 simple_task.py ${SLURM_ARRAY_TASK_ID} ${SLURM_ARRAY_TASK_STEP}`)

- simple_task.py
  - The code for algorithm A and algorithm B
  - The paths for datasets X, Y, and Z

Once you have modified the scripts, you can submit the job to the cluster by running:

```bash
sbatch slurm-NeSI.sh
```

This will submit the job to the Slurm scheduler and start running the tasks.

You can also use the `run_experiment.bash` script to automate the process of pulling the latest code from Git, updating any submodules, and submitting the Slurm job. Here's how to use it:

```bash
bash run_experiment.bash
```

This will execute the following steps:

1. Pull the latest code from Git and update any submodules (`git pull --recurse-submodules` and `git submodule update --recursive --remote`)
2. Submit the Slurm job to the cluster (`sbatch slurm-NeSI.sh`)
3. Check the status of the job using `squeue -u username`

You can modify the username in the `squeue` command to match your NeSI username.

## Requirements

- Slurm
- Python 3
- Git

## Author

[Hengzhe Zhang](https://github.com/hengzhe-zhang/)
