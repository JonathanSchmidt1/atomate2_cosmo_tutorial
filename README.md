# Atomate2 Tutorial

A hands-on tutorial for running DFT and ML-potential workflows on the kuma cluster using [atomate2](https://github.com/materialsproject/atomate2), [jobflow](https://github.com/materialsproject/jobflow), and [FireWorks](https://materialsproject.github.io/fireworks/).

---


## Installation

We will install packages both on our local machine to be able to submit jobs to a database and retrieve results for analysis, and on an HPC system to retrieve job instructions from the database, run the calculations and send results back to the database.

### Kuma
Connect to the kuma cluster, clone the repository and set up a virtual environment:

```bash
git clone https://github.com/JonathanSchmidt1/atomate2_cosmo_tutorial.git
cd atomate2_cosmo_tutorial
uv venv .atomate2
source .atomate2/bin/activate
uv pip install -r requirements.txt
```
change the name in my_fworker.yaml to e.g. your username.

---
### Local
On your computer or workstation (wherever you intend to run the jupyernotebooks) run:

```bash
git clone https://github.com/JonathanSchmidt1/atomate2_cosmo_tutorial.git
cd atomate2_cosmo_tutorial
uv venv .atomate2
source .atomate2/bin/activate
uv pip install -r requirements_2.txt
```

and (adjust scp command base on your ssh config)

```bash
scp username@kuma:/work/cosmo/jonschmi/atomate2/config/jobflow.yaml ./
scp username@kuma:/work/cosmo/jonschmi/atomate2/config/my_launchpad.yaml ./
```

To access the database you will have to be in the EPFL private network. 

## Setup

### Environment variables

Config files for the database are already set up at `/work/cosmo/jonschmi/atomate2/config/`. Export the following environment variables so jobflow and FireWorks know where to find them:

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
