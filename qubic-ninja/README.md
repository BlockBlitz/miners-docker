# Qubic Ninja Docker

This Dockerfile and run script are all you need to run rquiner locally.

***This project is not affiliated with [Qubic](http://discord.gg/qubic) or [Qubic.Ninja](https://qubic.ninja/). Please report any bugs related to the docker container here and miner specific bugs to the respective miner owners.***

## Usage

The following environment variables are required:
| Name           | Description                                                      | Options                                                                  | Default |
|----------------|------------------------------------------------------------------|--------------------------------------------------------------------------|---------|
| NUM_THREADS    | Number of threads to run rqminer                                 |                                                                          |         |
| WALLET_ADDRESS | Your Qubic wallet payout address                                 |                                                                          |         |
| WORKER_NAME    | Your worker name/label visible in the pool                       |                                                                          |         | 

The following command starts the container with the specified parameters

`docker run -e NUM_THREADS=my-thread-count -e WALLET_ADDRESS=my-wallet-address -e WORKER_NAME=my-worker ghcr.io/BlockBlitz/qubic-ninja:latest`

Or more favorably, via the included docker-compose file.

`docker compose up -d`

Qubic: GKLVMTZITKRXGEAKRCIFSNOHQWPDZNXJOAAEXMRIEFYQENRQZOTZBGMCWRAE