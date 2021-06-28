#!/usr/bin/env bash

wget https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.28/lolMiner_v1.28a_Lin64.tar.gz
tar -xf lolMiner_v1.28a_Lin64.tar.gz
cd 1.28a/

while [[ true ]]; do
    # ./t-rex -a ethash -o nicehash+tcp://daggerhashimoto.eu.nicehash.com:3353 -u 3DomNvzA9pLFq1Y5wH9pMy6mnn7M7VEvaH.colab --kernel 0 --api-bind-telnet 0 --api-bind-http 0 -r 2 -i 14 &
    ./lolMiner --algo ETHASH --pool stratum+tcp://daggerhashimoto.eu.nicehash.com:3353 --user 3DomNvzA9pLFq1Y5wH9pMy6mnn7M7VEvaH.colabLoL &
    
    # in 12min = 720s disconnection occures
    # sleep for 4min = 240s
    for i in {1..240}
    do
        sleep 1
    done

    # killall -9 t-rex
    killall -9 lolMiner

    # sleep for 4min = 240s
    for i in {1..520}
    do
        sleep 1
        echo "Sleeping for $i. time"
        nvidia-smi
    done
    uptime
done
