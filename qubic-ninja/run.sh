#!/bin/sh

# Delete any old logs if present
rm ./log/* 2> /dev/null

./qubic.ninja -i="$WALLET_ADDRESS" -t="$NUM_THREADS" -n="$WORKER_NAME" >/dev/null 2> /dev/null &
until [ -d ./log ] && [ -f ./log/*.log ]
do
    echo "Waiting for shuriken to start..."
    sleep 1
done
tail -f ./log/*
