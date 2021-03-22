# How to create postgresql container automatically on school computers

Note: this guide is for users who know what they do - use with care

- clone the repository or at least the 2 script files in this directory
- fix paths in the scripts - IMPORTANT
- run the provsql.sh script:
```sh
bash provsql.sh
```
look in psql.sh (inside the container it is by default at ```/files/psql.sh```, and you have vim and less)
for running instructions for postgres. after that, you can connect to the database from the host you are working on - for example, with python and psycog2 - look at the end of provsql.sh
