# How to create postgresql container automatically on school computers

Note: this guide is for users who know what they do - use with care.  
for any problem, mail: [system@cs.tau.ac.il](system@cs.tau.ac.il), and link to this repo.

To start:

- clone the repository or at least the 2 script files in this directory
- fix paths in the scripts - IMPORTANT!!
- run the provsql.sh script:

```sh
bash provsql.sh
```

look in psql.sh (inside the container it is by default at ```/scripts/psql.sh```, and you have vim and less)
for running instructions for postgres. after that, you can connect to the database from the host you are working on - for example, with python and psycog2 - look at the end of provsql.sh

basic usage reference: udocker run --containerauth --publish=2345:5432 --volume=${UDOCKER_DIR}/../cs-tau-system/provsql:/scripts psql bash /scripts/run-server.sh

## Example - fast start

useful for the first use, for example if the directory was deleted. start the server:

```sh

mkdir -p /vol/scratch/`whoami`
cd /vol/scratch/`whoami`

git clone https://github.com/yuvalyehudab/cs-tau-system.git
cd cs-tau-system/
bash provsql/provsql.sh

```

from another terminal, you can now connect to check that the server is up.  
for example, create and activate a conda evironment:

```sh

conda env create --name provsql --file /vol/scratch/`whoami`/cs-tau-system/provsql/env.yml
conda activate provsql

```

now you can run ```conn_check.py```:

```sh

python conn_check.py

```

to stop the server you can:

```sh

udocker run --containerauth --publish=2345:5432 --volume=/vol/scratch/`whoami`/cs-tau-system/provsql:/scripts psql bash /scripts/stop-server.sh

```

from now on, if the container wasn't deleted, you can run it with:

```sh

udocker run --containerauth --publish=2345:5432 --volume=/vol/scratch/`whoami`/cs-tau-system/provsql:/scripts psql bash /scripts/run-server.sh

```

and stop it like seen before.

## for vscode users

if you want to configure your python interpreter to run the code, and you use remote-ssh, you can choose the path of the interpreter of the environment - ```which python``` inside an active environment, ``` Ctrl + Shift + p ``` to command pallette, choose python interpreter and insert the path you got.

## basic conda installation

```sh

cd /vol/scratch/`whoami`/cs-tau-system
bash install-bash-on-scratch

```

## creating conda environment with psycopg2

such env will fit cs-tau-system/provsql/conn_check.py

```sh

conda env create --name provsql --file /vol/scratch/`whoami`/cs-tau-system/provsql/env.yml
conda activate provsql

```

updating existing environment:

```sh

conda env update --file /vol/scratch/`whoami`/cs-tau-system/provsql/env.yml --prune

```

written by yuvalyehudab
