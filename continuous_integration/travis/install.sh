#!/usr/bin/env bash
set -xe

conda config --set always_yes yes --set changeps1 no

conda create -n test-environment \
    cryptography \
    dask \
    distributed \
    flake8 \
    nomkl \
    pytest \
    python=$1 \
    pyyaml \
    regex \
    ipywidgets

source activate test-environment

pip install conda-pack skein pytest-asyncio black

cd ~/dask-yarn
pip install -v --no-deps .

conda list

set +xe
