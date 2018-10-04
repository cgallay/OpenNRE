#!/bin/bash

#Download the training dataset
mkdir data
wget --tries=0 --read-timeout=20 --continue -O data/nyt.tar https://drive.google.com/uc?export=download&confirm=2DhJ&id=1eSGYObt-SRLccvYCsWaHx1ldurp9eDN_
#wget -O data/nyt.tar https://cloud.tsinghua.edu.cn/seafhttp/files/722dbf95-cf28-44cb-b5c6-214726321d62/nyt.tar
cd data
tar -xvf nyt.tar
cd ..