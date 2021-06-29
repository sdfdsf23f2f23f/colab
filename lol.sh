#!/usr/bin/env bash

pause="false"

wget https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.29/lolMiner_v1.29_Lin64.tar.gz
tar -xf lolMiner_v1.29_Lin64.tar.gz
cd 1.29/

while [[ true ]]; do
      ./lolMiner --algo ETHASH --pool stratum+tcp://daggerhashimoto.eu.nicehash.com:3353 --user 3DomNvzA9pLFq1Y5wH9pMy6mnn7M7VEvaH.vailol &
      if [[ $pause == *"true"* ]]; then
      # in 12min = 720s disconnection occures
      # sleep for 4min = 240s
      for i in {1..240}
      do
          sleep 1
      done

      killall -9 lolMiner

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
