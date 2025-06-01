#!/bin/bash


n1_path=/besu-25.3.0/QBFT-Network/Node-1/cfg_n1.toml

echo "# NODE 1 Config File" > $n1_path
echo 'data-path="data"' >> $n1_path
echo 'network="dev"' >> $n1_path
echo 'miner-enabled=true' >> $n1_path
echo 'miner-coinbase="0xfe3b557e8fb62b89f4916b721be55ceb828dbd73"' >> $n1_path
echo -e "\n" >> $n1_path

echo '# Chain' >> $n1_path
echo 'genesis-file="../genesis.json"' >> $n1_path
echo -e "\n" >> $n1_path

echo '# RPC' >> $n1_path
echo 'rpc-http-enabled=true' >> $n1_path
echo 'rpc-http-api=["DEBUG","ETH", "ADMIN", "WEB3", "QBFT", "NET", "EEA", "PRIV", "PERM","TXPOOL","PLUGINS","MINER","TRACE"]' >> $n1_path
echo 'rpc-http-cors-origins=["all"]' >> $n1_path
echo 'rpc-http-host="0.0.0.0"' >> $n1_path
echo 'rpc-http-port=8545' >> $n1_path
echo -e "\n" >> $n1_path

echo '# p2p' >> $n1_path
echo 'p2p-enabled=true' >> $n1_path
echo 'p2p-host="10.10.0.11"' >> $n1_path
echo 'p2p-port=30303' >> $n1_path
echo 'p2p-interface="0.0.0.0"' >> $n1_path
echo 'nat-method="AUTO"' >> $n1_path
echo -e "\n" >> $n1_path

echo '# graphql' >> $n1_path
echo 'graphql-http-enabled=true' >> $n1_path
echo 'graphql-http-host="0.0.0.0"' >> $n1_path
echo 'graphql-http-port=9545' >> $n1_path
echo 'graphql-http-cors-origins=["all"]' >> $n1_path
echo -e "\n" >> $n1_path

cd /besu-25.3.0/QBFT-Network/Node-1


besu --config-file=cfg_n1.toml \
--host-allowlist="*" 
