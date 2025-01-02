FROM ubuntu

WORKDIR /opt

ARG PYVERSION=3.11.11

RUN apt update && \
    apt install -y wget gcc make g++ libbz2-dev libssl-dev tk-dev liblzma-dev libgdbm-dev libsqlite3-dev libffi-dev libncurses-dev libreadline-dev libgdbm-dev && \
    wget https://www.python.org/ftp/python/${PYVERSION}/Python-${PYVERSION}.tgz && \
    tar -xzf Python-${PYVERSION}.tgz && \
    mv Python-${PYVERSION} python

WORKDIR /opt/python
RUN ./configure --enable-optimizations && \
    make | tee make.log

ENTRYPOINT /opt/python/python
