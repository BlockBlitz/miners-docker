# Qubicmine with CUDA

This Dockerfile and run script are all you need to run Qubicmine with support for NVIDIA GPUs.

***This project is not affiliated with [Qubic](http://discord.gg/qubic) or [Qubicmine](https://qubicmine.pro/). Please report any bugs related to the docker container here and miner specific bugs to the respective miner owners.***

## Usage

The following environment variables are required:
| Name            | Description                                                     | Options                                                                  | Default |
|-----------------|-----------------------------------------------------------------|--------------------------------------------------------------------------|---------|
| WALLET_ADDRESS  | Your Qubic wallet payout address                                |                                                                          |         |
| WORKER_NAME     | Your worker name/label visible in the pool                      |                                                                          |         | 
| NUM_THREADS     | Number of CPU threads to use. Set to 0 to disable CPU Mining.   |                                                                          |         | 
| USE_GPU         | Enables GPU Mining                                              | true or false                                                            | false   | 

The following command starts the container with the specified parameters for CPU mining:

`docker run -e WALLET_ADDRESS=my-wallet-address -e WORKER_NAME=my-worker -e NUM_THREADS=12 ghcr.io/BlockBlitz/qubicmine:latest`

The following command starts the container with the specified parameters for CPU/GPU mining:

`docker run --device=/dev/kfd --device=/dev/dri --group-add=video --security-opt seccomp=unconfined -e WALLET_ADDRESS=my-wallet-address -e WORKER_NAME=my-worker -e NUM_THREADS=12 -e USE_GPU=true ghcr.io/BlockBlitz/qubicmine:latest`

Or more favorably, via the included docker-compose file.

`docker compose up -d`

Qubic: GKLVMTZITKRXGEAKRCIFSNOHQWPDZNXJOAAEXMRIEFYQENRQZOTZBGMCWRAE
