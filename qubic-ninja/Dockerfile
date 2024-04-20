FROM debian

RUN apt update && apt install -y ca-certificates wget

RUN mkdir /qubic-ninja
WORKDIR /qubic-ninja
COPY run.sh .

RUN wget https://dl.qubic.ninja/ninja/linux-latest.tar.gz -O linux-latest.tar.gz && \
    tar xzvf linux-latest.tar.gz && \
    chmod +x qubic.ninja

CMD ["./run.sh"]
