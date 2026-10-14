# Development Setup

## Verified Environment

- Python: 3.11.17
- Conda environment: complaint-ds
- Platform: macOS

Direct dependencies are listed in requirements.txt.
requirements-lock.txt records the installed package versions from the
verified development environment.

## Create the Environment

Run these commands from the repository root:

    conda create -n complaint-ds python=3.11 pip
    conda activate complaint-ds
    python -m pip install -r requirements-lock.txt
    python -m pip check

The package snapshot was verified on the development Mac.
Compatibility with other platforms has not yet been tested.

## Register the Notebook Kernel

    python -m ipykernel install --user --name complaint-ds --display-name "Python (complaint-ds)"

## Start JupyterLab

    python -m jupyterlab

Open notebooks/00_environment_check.ipynb and select
Python (complaint-ds).

## Environment Verification

The environment check notebook verifies:

- The Python version and executable path
- Imports of the core data analysis libraries
- A basic DuckDB SQL query

## Local Data

Store original downloads in data/raw and derived datasets in
data/processed. These directories are excluded from Git.

Store source URLs, versions, and download metadata in data/manifests.
