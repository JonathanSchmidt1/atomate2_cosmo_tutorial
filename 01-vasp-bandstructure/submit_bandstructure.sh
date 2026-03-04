#!/bin/bash
#SBATCH --nodes 1
#SBATCH --ntasks-per-node 1
#SBATCH --cpus-per-task 2
#SBATCH --time 00:10:00
#SBATCH --partition=mig
#SBATCH --gres=gpu:1

module load nvhpc/24.7-mpi vasp/6.4.1-openmp-cuda
source ../.atomate2/bin/activate
export FW_CONFIG_FILE=/work/cosmo/jonschmi/atomate2/config/FW_config.yaml
export JOBFLOW_CONFIG_FILE=/work/cosmo/jonschmi/atomate2/config/jobflow.yaml
export ATOMATE2_CONFIG_FILE=/work/cosmo/jonschmi/atomate2/config/atomate2.yaml

rlaunch -w ../my_fworker.yaml rapidfire
