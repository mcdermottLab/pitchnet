#!/bin/bash
#
#SBATCH --job-name=bez2018model
#SBATCH --out="trash/slurm-%A_%a.out"
#SBATCH --cpus-per-task=2
#SBATCH --mem-per-cpu=4000
#SBATCH --nodes=1
#SBATCH --time=0-16:00:00
#SBATCH --time-min=0-10:00:00
#SBATCH --exclude=node[001-030,069]
#SBATCH --array=0-35
#SBATCH --partition=sched_om_MCDERMOTT
##SBATCH --partition=use-everything

### Define source_regex and dest_filename here (use single quotes to prevent regex from expanding)
source_regex='/om/user/msaddler/data_pitchnet/shackcarl1994/AltPhase_v01_f0min080_f0max320/*.hdf5'
dest_filename='/om/user/msaddler/data_pitchnet/shackcarl1994/AltPhase_v01_f0min080_f0max320/cf100_species002_spont070/bez2018meanrates.hdf5'
jobs_per_source_file=36
offset=0
job_idx=$(($SLURM_ARRAY_TASK_ID + $offset))

export HDF5_USE_FILE_LOCKING=FALSE

python -u nervegram_run_parallel.py "${source_regex}" "${dest_filename}" ${job_idx} ${jobs_per_source_file}
