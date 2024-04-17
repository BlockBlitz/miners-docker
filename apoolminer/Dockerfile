FROM ubuntu:22.04

WORKDIR /root

RUN apt update && \
    apt install -y ca-certificates wget

ARG APOOL_VERSION="v1.2.4"
ENV APOOL_VERSION=$APOOL_VERSION
COPY run.sh .
RUN wget https://github.com/apool-io/apoolminer/releases/download/${APOOL_VERSION}/apoolminer_linux_${APOOL_VERSION}.tar && \
    tar xzvf ./apoolminer_linux_${APOOL_VERSION}.tar && \
    chmod +x ./apoolminer

CMD ["./run.sh"]
