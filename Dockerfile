FROM ubuntu

WORKDIR /root

ARG VERSION=3.11.11
RUN apt update && \
    apt install -y wget gcc make g++ libbz2-dev libssl-dev tk-dev liblzma-dev libgdbm-dev libsqlite3-dev libffi-dev && \
    wget https://www.python.org/ftp/python/${VERSION}/Python-${VERSION}.tgz && \
    tar -xzf Python-${VERSION}.tgz && \
    cd Python-${VERSION} && \
    ./configure --enable-optimizations && \
    make

ENTRYPOINT /root/Python-${VERSION}/python
