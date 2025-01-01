FROM ubuntu

WORKDIR /root

ENV PYVERSION=3.11.11
RUN apt update && \
    apt install -y wget gcc make g++ libbz2-dev libssl-dev tk-dev liblzma-dev libgdbm-dev libsqlite3-dev libffi-dev && \
    wget https://www.python.org/ftp/python/${PYVERSION}/Python-${PYVERSION}.tgz && \
    tar -xzf Python-${PYVERSION}.tgz && \
    cd Python-${PYVERSION} && \
    ./configure --enable-optimizations && \
    make

ENTRYPOINT /root/Python-${PYVERSION}/python
