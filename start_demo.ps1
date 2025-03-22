# Define a política de execução apenas para a sessão atual do PowerShell
# Remove a mensagem: "Não é possível carregar o módulo de PSReadline"
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

# Create a local docker subnet
Start-Job -ScriptBlock {
    docker network create --subnet=10.10.0.0/24 rede_besu
}

# Start Node1
Start-Process powershell -ArgumentList "-NoExit", "-Command", "docker run --privileged -p 8545:8545 -p 30303:30303 --rm -it --name Node1 --hostname Node1 --network=rede_besu --ip=10.10.0.11 besu:lfdt /bin/bash "
Start-Sleep -Milliseconds 500

# Start Node2
Start-Process powershell -ArgumentList "-NoExit", "-Command", "docker run --privileged -p 8546:8546 -p 30304:30304 --rm -it --name Node2 --hostname Node2 --network=rede_besu --ip=10.10.0.12 besu:lfdt /bin/bash"
Start-Sleep -Milliseconds 500

# Start Node3
Start-Process powershell -ArgumentList "-NoExit", "-Command", "docker run --privileged -p 8547:8547 -p 30305:30305 --rm -it --name Node3 --hostname Node3 --network=rede_besu --ip=10.10.0.13 besu:lfdt /bin/bash"
Start-Sleep -Milliseconds 500

# Start Node4
Start-Process powershell -ArgumentList "-NoExit", "-Command", "docker run --privileged -p 8548:8548 -p 30306:30306 --rm -it --name Node4 --hostname Node4 --network=rede_besu --ip=10.10.0.14 besu:lfdt /bin/bash "
Start-Sleep -Milliseconds 500

