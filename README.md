# cs-tau-system
scripts, bugs solution and wiki for system users

## Quick connection guide

1. connect to one of the servers

```sh
ssh c-00[1-8]
```

2. Install anaconda:

```sh
cd <your own directory>
wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh
bash Anaconda3-2021.05-Linux-x86_64.sh -b -p `pwd`/anaconda3
/anaconda3/bin/conda init bash
```

3. Create new env:

```sh
bash
conda create -n <env-name> python=3.8
conda activate <env-name>
```

4. Install packages and run your code:

```sh
conda install matplotlib
pip install --upgrade pip
python app.py
```
