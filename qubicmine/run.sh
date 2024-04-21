#!/bin/sh
overwrites="{ }"
if [ "$USE_GPU" = "true" ]; then
    overwrites=$(jq -nc --arg CUDA 12 \
                        '$ARGS.named'
               )
fi
settings=$(jq -nc --arg amountOfThreads $NUM_THREADS \
                  --arg payoutId $WALLET_ADDRESS \
                  --arg alias $WORKER_NAME \
                  --argjson allowHwInfoCollect true \
                  --argjson overwrites "$overwrites" \
                  '$ARGS.named'
         )
config=$(jq -n --argjson Settings $settings '$ARGS.named')
echo $config > qubicmine.json
echo "qubicmine.json config:"
cat qubicmine.json

sysctl -w vm.nr_hugepages=$(( 92*NUM_THREADS ))

./qubic-pool-miner
