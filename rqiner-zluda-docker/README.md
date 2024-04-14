# Rqiner Cuda running under ZLUDA

This Dockerfile and run script are all you need to run rquiner-cuda under ZLUDA for AMD GPUs.

***This project is not affiliated with [Qubic](http://discord.gg/qubic) or [QubicSolutions](https://qubic.solutions/). Please report any bugs related to the docker container here and miner specific bugs to the respective miner owners.***

## Usage

The following environment variables are required:
| Name           | Description                                                      | Options                                                                  | Default |
|----------------|------------------------------------------------------------------|--------------------------------------------------------------------------|---------|
| WALLET_ADDRESS | Your Qubic wallet payout address                                 |                                                                          |         |
| WORKER_NAME    | Your worker name/label visible in the pool                       |                                                                          |         | 

The following command starts the rqiner container with the specified parameters

`docker run --device=/dev/kfd --device=/dev/dri --group-add=video --security-opt seccomp=unconfined -e WALLET_ADDRESS=my-wallet-address -e WORKER_NAME=my-worker ghcr.io/BlockBlitz/rqiner-zluda:latest`

Or more favorably, via the included docker-compose file.

Qubic: GKLVMTZITKRXGEAKRCIFSNOHQWPDZNXJOAAEXMRIEFYQENRQZOTZBGMCWRAE
