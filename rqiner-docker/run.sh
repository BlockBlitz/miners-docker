#!/bin/sh

case "$ARCHITECTURE" in
    broadwell)
        BINARY="rqiner-x86-broadwell";;
    haswell)
        BINARY="rqiner-x86-haswell";;
    musl)
        BINARY="rqiner-x86-musl";;
    znver2|zen2)
        BINARY="rqiner-x86-znver2";;
    znver3|zen3)
        BINARY="rqiner-x86-znver3";;
    znver4|zen4)
        BINARY="rqiner-x86-znver4";;
    none|*)
        BINARY="rqiner-x86";;
esac

./$BINARY -t $NUM_THREADS -i $WALLET_ADDRESS -l $WORKER_NAME 
