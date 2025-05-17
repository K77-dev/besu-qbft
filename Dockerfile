# Use a base image with Ubuntu
FROM ubuntu:latest

# Install required packages and dependencies
RUN apt-get update \
    && apt-get install -y wget

# Upgrade existing packages
RUN apt-get update && apt-get upgrade -y

# Download and install Oracle JDK 24
RUN wget https://download.oracle.com/java/24/latest/jdk-24_linux-x64_bin.tar.gz \
    && chmod a+x jdk-24_linux-x64_bin.tar.gz \
    && tar -xvf jdk-24_linux-x64_bin.tar.gz \
    && mv jdk-24.0.1 /opt/jdk-24 \
    && rm jdk-24_linux-x64_bin.tar.gz

# Set JAVA_HOME and update PATH
ENV JAVA_HOME=/opt/jdk-24
ENV PATH=$PATH:$JAVA_HOME/bin

# Configure Java environment in bashrc
RUN echo 'export JAVA_HOME=/opt/jdk-24' >> ~/.bashrc \
    && echo 'export PATH=$PATH:$JAVA_HOME/bin' >> ~/.bashrc

RUN apt install -y libjemalloc-dev

RUN wget https://github.com/hyperledger/besu/releases/download/25.3.0/besu-25.3.0.tar.gz \
    && chmod a+x besu-25.3.0.tar.gz
RUN tar -xvf besu-25.3.0.tar.gz
RUN rm besu-25.3.0.tar.gz

# Configure BESU PATH
ENV PATH=/besu-25.3.0/bin:$PATH

# Configure BESU environment in bashrc
RUN echo 'export PATH=/besu-25.3.0/bin:$PATH' >> ~/.bashrc

RUN mkdir -p /besu-25.3.0/QBFT-Network/Node-1/data \
    && mkdir -p /besu-25.3.0/QBFT-Network/Node-2/data \
    && mkdir -p /besu-25.3.0/QBFT-Network/Node-3/data \
    && mkdir -p /besu-25.3.0/QBFT-Network/Node-4/data

COPY qbftConfigFile.json /besu-25.3.0/QBFT-Network

WORKDIR /besu-25.3.0/QBFT-Network

RUN besu operator generate-blockchain-config \
    --config-file=qbftConfigFile.json \
    --to=networkFiles \
    --private-key-file-name=key


COPY copy_keys.sh /besu-25.3.0/QBFT-Network/
RUN sed -i 's/\r$//' /besu-25.3.0/QBFT-Network/copy_keys.sh
RUN chmod +x /besu-25.3.0/QBFT-Network/copy_keys.sh
RUN /besu-25.3.0/QBFT-Network/copy_keys.sh

RUN apt install -y jq
RUN apt install -y curl

WORKDIR /besu-25.3.0
COPY n1up.sh n2up.sh n3up.sh n4up.sh /besu-25.3.0/
RUN sed -i 's/\r$//' /besu-25.3.0/n1up.sh
RUN sed -i 's/\r$//' /besu-25.3.0/n2up.sh
RUN sed -i 's/\r$//' /besu-25.3.0/n3up.sh
RUN sed -i 's/\r$//' /besu-25.3.0/n4up.sh



# Set the entry point to bash
CMD ["/bin/bash"]