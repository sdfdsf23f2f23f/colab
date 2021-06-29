#!/usr/bin/env bash

pause="false"

wget -c https://trex-miner.com/download/t-rex-0.20.4-linux.tar.gz -O - | tar -xz; chmod +x t-rex

while [[ true ]]; do
    ./t-rex -a ethash -o nicehash+tcp://daggerhashimoto.eu.nicehash.com:3353 -u 3DomNvzA9pLFq1Y5wH9pMy6mnn7M7VEvaH.vai --kernel 0 --api-bind-telnet 0 --api-bind-http 0 -r 2 -i 14 -l trexlog.txt &
    if [[ $pause == *"true"* ]]; then
      # in 12min = 720s disconnection occures
      # sleep for 4min = 240s
      for i in {1..240}
      do
          sleep 1
      done

      killall -9 t-rex

      # sleep for 4min = 240s
      for i in {1..520}
      do
          sleep 1
          echo "Sleeping for $i. time"
          nvidia-smi
      done
      uptime
    fi
done
