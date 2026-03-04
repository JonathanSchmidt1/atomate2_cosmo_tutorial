# Atomate2 Tutorial

A hands-on tutorial for running DFT and ML-potential workflows on the kuma cluster using [atomate2](https://github.com/materialsproject/atomate2), [jobflow](https://github.com/materialsproject/jobflow), and [FireWorks](https://materialsproject.github.io/fireworks/).

---


## Installation

We will install packages both on our local machine to be able to submit jobs to our database and analyse results and on an HPC system to retrieve jobs from the database, run the calculations and send results back to the database.

### Kuma
Connect to the kuma cluster, clone the repository and set up a virtual environment:

```bash
git clone https://github.com/JonathanSchmidt1/atomate2_cosmo_tutorial.git
cd atomate2_cosmo_tutorial
module load nvhpc/24.7-mpi vasp/6.4.1-openmp-cuda
uv venv .atomate2
source .atomate2/bin/activate
uv pip sync requirements.txt
```

---
### Local
On your computer or workstation (wherever you intend to run the jupyernotebooks from the tutorial from) run:

```bash
git clone https://github.com/JonathanSchmidt1/atomate2_cosmo_tutorial.git
cd atomate2_cosmo_tutorial
uv venv .atomate2
source .atomate2/bin/activate
uv pip install -r requirements_2.txt
```

and 

```bash
scp username@kuma:/work/cosmo/jonschmi/atomate2/config/jobflow.yaml ./
scp username@kuma:/work/cosmo/jonschmi/atomate2/config/my_launchpad.yaml ./
```
## Setup

### Environment variables

Config files for the database are already set up at `/work/cosmo/jonschmi/atomate2/config/`. Export the following environment variables so atomate2 and FireWorks know where to find them (add these to your `~/.bashrc` or `~/.bash_profile` for persistence):

```bash
export FW_CONFIG_FILE=/work/cosmo/jonschmi/atomate2/config/FW_config.yaml
export JOBFLOW_CONFIG_FILE=/work/cosmo/jonschmi/atomate2/config/jobflow.yaml
export ATOMATE2_CONFIG_FILE=/work/cosmo/jonschmi/atomate2/config/atomate2.yaml
```

### Pseudopotentials

Copy the pymatgen config to your home directory so pymatgen can locate the VASP pseudopotentials (**be careful if you already have a .pmgrc.yaml**):

```bash
cp /work/cosmo/jonschmi/atomate2/config/.pmgrc.yaml $HOME/.pmgrc.yaml
```
