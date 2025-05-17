#!/bin/bash

# Configurar para sair em caso de erro
set -e

# Criar uma sub-rede Docker local
docker network create --subnet=10.10.0.0/24 rede_besu || echo "A rede já existe."

# Iniciar Node1
osascript -e 'tell application "Terminal" to do script "docker run --privileged -p 8545:8545 -p 30303:30303 -it --name Node1 --hostname Node1 --network=rede_besu --ip=10.10.0.11 besu:lfdt /bin/bash"'
sleep 0.5

# Iniciar Node2
osascript -e 'tell application "Terminal" to do script "docker run --privileged -p 8546:8546 -p 30304:30304 -it --name Node2 --hostname Node2 --network=rede_besu --ip=10.10.0.12 besu:lfdt /bin/bash"'
sleep 0.5

# Iniciar Node3
osascript -e 'tell application "Terminal" to do script "docker run --privileged -p 8547:8547 -p 30305:30305 -it --name Node3 --hostname Node3 --network=rede_besu --ip=10.10.0.13 besu:lfdt /bin/bash"'
sleep 0.5

# Iniciar Node4
osascript -e 'tell application "Terminal" to do script "docker run --privileged -p 8548:8548 -p 30306:30306 -it --name Node4 --hostname Node4 --network=rede_besu --ip=10.10.0.14 besu:lfdt /bin/bash"'
sleep 0.5
