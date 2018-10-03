#!/bin/bash

#Download the training dataset
mkdir data
wget -O data/nyt.tar https://cloud.tsinghua.edu.cn/f/11391e48b72749d8b60a/?dl=1
cd data
tar -xvf nyt.tar
cd ..