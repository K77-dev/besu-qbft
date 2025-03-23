# ⛓️ Tutorial  - Besu Private Network QBFT 

#### Este Documento tem como objetivo configurar uma Rede Privada BESU com o protocolo QBFT com fins única e exclusivamente de teste e aprendizado. Ao final você terá um ambiente com 4 nós Besu se comunicando, transações de tokens realizadas via Metamask e um explorador de blocos simples mas muito eficiente.

## Pré Requisitos
- ✅ Docker e Docker Compose instalados
- ✅ Conta ativada no Github

---

## Documentação Oficial
🔗 [BESU Private QBFT](https://besu.hyperledger.org/private-networks/tutorials/qbft)

---

## Configurar BESU
> ⚠️ Considerando o ambiente com Docker e WSL2 configurado:

1. Confira se o Docker esta habilitado para WSL2
    > ⚙️Settings > Resources > WSL Integration

1. ⬇️ Clone os fontes do GitHub:

    ```sh
    git clone https://github.com/alexandregomes3112/Private-BESU-QBFT.git
    ```

1. Entre na pasta onde os fontes foram copiados

    ```sh
    cd Private-BESU-QBFT/
    ``` 
1. 🔎 Verifique se o arquivo Dockerfile está no mesmo diretório que você entrou e faça o build das imagens

    ```sh 
    docker build -t besu:lfdt .
    ```
    > ⏳ Aguarde cerca de 2 a 5min para baixar e configurar o ambiente

1. Caso esteja usando **Windows** (💩), execute o script abaixo:

    ```sh
    .\start_demo.ps1
    ```

    > ⚠️ Serão abertos 4 terminais, cada um representa um nó/instância do BESU.

1. Vá até o `node1` e execute no terminal dele:

    ```sh
    ./n1up.sh
    ```

    > ⏳ Aguarde até o endereço do enode do `node1`aparecer

1. Vá até o `node2` e execute no terminal dele:

    ```sh
    ./n2up.sh
    ```

1. Vá até o `node3` e execute no terminal dele:

    ```sh
    ./n3up.sh
    ```
1. Vá até o `node4` e execute no terminal dele:

    ```sh
    ./n4up.sh
    ```

    > ⏳ Após cerca de 1 a 2min, a rede começará a produzir blocos e estará pronta para receber transações.

--- 

## Configurar o Explorador de Blocos da Chainless

📖 Documentação Oficial:
🔗 [Chainless](https://besu.hyperledger.org/private-networks/how-to/monitor/chainlens)


1. ⬇️ Em um terminal WSL2 rodando **UBUNTU** Clone o repositório da Chainless

    ```sh
    git clone https://github.com/web3labs/chainlens-free
    ```

1. Entre na pasta com os arquivos da Chainless

    ```sh
    cd chainlens-free/docker-compose/
    ```

1. 🔎 Procure o arquivo `docker-compose.yml` disponível na pasta onde estão os arquivos do BESU e substitua pelo arquivo que está em: `chainlens-free/docker-compose/`

1. Execute o script de inicialização do ambiente da Chainless:
    ```sh
    NODE_ENDPOINT=http://10.10.0.11:8545 docker-compose up
    ```

    > ⏳ Aguarde cerca de 5 a 10min para que todo o ambiente seja configurado e sincronizado.

    > 👀 Você pode acompanhar se o ambiente está funcional nos logs do terminal do **UBUNTU** e pode verificar se o ambiente está funcional no seguinte endereço:

    🔗 [Explorador de Blocos](http://localhost)


## ⚙️ Configurar MetaMask

1. Adicione a rede na MetaMask com os sequintes parâmetros:

- 🛜 Network Name: `Localhost 8545`
- 🔗 RPC URL: `http://localhost:8545`
- 🆔 ChainID = `1337`
- 🔎 Block Explorer = `http://localhost/`

1. Importe as chaves privadas da rede que você acabou de para Metamask

    > 🔑 Test Acc1
    ```sh
    0x8f2a55949038a9610f50fb23b5883af3b4ecb3c3bb792cbcefbd1542c692be63
    ```

    > 🔑 Test Acc2
    ```sh 
    0xc87509a1c067bbde78beb793e6fa76530b6382a4c0241e5e4a9ec0a0f44dc0d3
    ```

    > 🔑 Test Acc3
    ```sh 
    0xae6ae8e5ccbfb04590405997ee2d52d2b330726137b875053c36d94e974d162f
    ```

1. 💱 Faça uma transação, teste e verifique no explorador de Blocos !


Espero que tenha ajudado ! 😊

Boa Diversão ! 
🛝🎡🎢🚀🎆🥳🎉


