FROM ubuntu:22.04

WORKDIR /root

RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
  ca-certificates \
  wget \
  jq

ARG QLI_VERSION="1.9.0"
ENV QLI_VERSION=$QLI_VERSION
COPY run.sh .
RUN wget https://dl.qubic.li/downloads/qli-Client-${QLI_VERSION}-Linux-x64.tar.gz && \
    tar xf qli-Client-${QLI_VERSION}-Linux-x64.tar.gz && \
    chmod +x qli-Client

CMD ["./run.sh"]
