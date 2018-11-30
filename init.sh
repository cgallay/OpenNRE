#!/bin/bash

#Download the training dataset
mkdir data
#wget --tries=0 --read-timeout=20 --continue -O data/nyt.tar https://drive.google.com/uc?export=download&confirm=2DhJ&id=1eSGYObt-SRLccvYCsWaHx1ldurp9eDN_
wget -c -O data/nyt.tar https://cloud.tsinghua.edu.cn/f/11391e48b72749d8b60a/?dl=1
cd data
tar -xvf nyt.tar
cd nyt
source ../../venv/bin/activate
python protobuf2json.py .
deactivate
cd ../..