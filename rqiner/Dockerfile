FROM ubuntu:22.04

ARG RQ_VERSION="v0.3.14"
ENV RQ_VERSION=$RQ_VERSION

RUN apt update && apt install -y ca-certificates wget

RUN mkdir /rqminer
WORKDIR /rqminer
COPY run.sh .

RUN wget https://github.com/Qubic-Solutions/rqiner-builds/releases/download/$RQ_VERSION/rqiner-x86-broadwell
RUN wget https://github.com/Qubic-Solutions/rqiner-builds/releases/download/$RQ_VERSION/rqiner-x86-ivybridge
RUN wget https://github.com/Qubic-Solutions/rqiner-builds/releases/download/$RQ_VERSION/rqiner-x86-znver2
RUN wget https://github.com/Qubic-Solutions/rqiner-builds/releases/download/$RQ_VERSION/rqiner-x86-znver3
RUN wget https://github.com/Qubic-Solutions/rqiner-builds/releases/download/$RQ_VERSION/rqiner-x86-znver4
RUN chmod +x rqiner*

CMD ["./run.sh"]
