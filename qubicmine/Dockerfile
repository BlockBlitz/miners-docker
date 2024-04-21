FROM ubuntu:22.04

WORKDIR /root

RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
  ca-certificates \
  wget \
  unzip \
  jq \
  libicu70

COPY run.sh .
RUN wget https://dl.qubicmine.pro/QubicMine-linux.zip && \
    unzip QubicMine-linux.zip 

CMD ["./run.sh"]
