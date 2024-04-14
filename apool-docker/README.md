# Apool Miner

This Dockerfile and run script are all you need to run apoolminer.

***This project is not affiliated with [Qubic](http://discord.gg/qubic) or [apool](https://www.apool.io/myMiner). Please report any bugs related to the docker container here and miner specific bugs to the respective miner owners.***

## Usage

The following environment variables are required:
| Name           | Description                                                      | Options                                                                  | Default |
|----------------|------------------------------------------------------------------|--------------------------------------------------------------------------|---------|
| ACCOUNT_NAME | Your apool account address                                 |                                                                          |         |
| WORKER_NAME    | Your worker name/label visible in the pool                       |                                                                          |         | 

The following command starts the container with the specified parameters:

`docker run -e ACCOUNT_NAME=my-account -e WORKER_NAME=my-worker ghcr.io/BlockBlitz/apoolminer:latest`

Or more favorably, via the included docker-compose file:

`docker compose up -d`

Qubic: GKLVMTZITKRXGEAKRCIFSNOHQWPDZNXJOAAEXMRIEFYQENRQZOTZBGMCWRAE
