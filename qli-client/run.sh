#!/bin/sh
overwrites="{ }"
if [ "$USE_GPU" = "true" ]; then
    overwrites=$(jq -nc --arg CUDA 12 \
                       '$ARGS.named'
               )
fi
settings=$(jq -nc --arg amountOfThreads $THREAD_COUNT \
                 --arg accessToken $ACCESS_TOKEN \
                 --arg alias $WORKER_NAME \
                 --argjson allowHwInfoCollect true \
	         --argjson overwrites "$overwrites" \
	         '$ARGS.named'
         )
config=$(jq -n --argjson settings $settings '$ARGS.named')
echo $config > appsettings.json
echo "Appsettings.json config:"
echo $config

./qli-Client
