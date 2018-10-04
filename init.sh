#!/bin/bash

#Download the training dataset
mkdir data
wget --tries=0 --read-timeout=20 --continue -O data/nyt.tar https://cloud.tsinghua.edu.cn/f/11391e48b72749d8b60a/?dl=1
#wget -O data/nyt.tar https://cloud.tsinghua.edu.cn/seafhttp/files/722dbf95-cf28-44cb-b5c6-214726321d62/nyt.tar
cd data
tar -xvf nyt.tar
cd ..