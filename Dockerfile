FROM ubuntu:xenial 
MAINTAINER jasonlin
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get upgrade -q -y && \
    apt-get dist-upgrade -q -y && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:ethereum/ethereum && \
    apt-get update && \
    apt-get install -y geth && \
    apt-get install -y solc && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -y build-essential python git nodejs && apt-get clean && npm install -g truffle && npm install -g ethereumjs-testrpc

EXPOSE 8545 
EXPOSE 30303 
EXPOSE 8080 

ENTRYPOINT ["geth"]
CMD ["--help"]
