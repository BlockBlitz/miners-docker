FROM ubuntu:22.04

WORKDIR /root

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  ca-certificates \
  wget \
  curl \
  gnupg \
  ltrace \
  file\
  python3-minimal \
  build-essential \
  git \
  cmake \
  ninja-build
ENV PATH="${PATH}:/opt/rocm/bin:/opt/rocm/llvm/bin"

ARG RUST_VERSION=1.77.1
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain=${RUST_VERSION}
RUN . $HOME/.cargo/env && cargo install bindgen-cli --locked

ARG ROCM_VERSION=5.7.3
RUN echo "Package: *\nPin: release o=repo.radeon.com\nPin-Priority: 600" > /etc/apt/preferences.d/rocm-pin-600
RUN mkdir --parents --mode=0755 /etc/apt/keyrings && \
  sh -c 'wget https://repo.radeon.com/rocm/rocm.gpg.key -O - |  gpg --dearmor | tee /etc/apt/keyrings/rocm.gpg > /dev/null' && \
  sh -c 'echo deb [arch=amd64 signed-by=/etc/apt/keyrings/rocm.gpg] https://repo.radeon.com/rocm/apt/${ROCM_VERSION} jammy main > /etc/apt/sources.list.d/rocm.list' && \
  apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  rocminfo \
  rocm-gdb \
  rocprofiler \
  rocm-smi-lib \
  hip-runtime-amd \
  comgr \
  hipblaslt-dev \
  hipfft-dev \
  rocblas-dev \
  rocsolver-dev \
  rocsparse-dev \
  miopen-hip-dev \
  rocm-device-libs && \
  echo 'export PATH="$PATH:/opt/rocm/bin"' > /etc/profile.d/rocm.sh && \
  echo '/opt/rocm/lib' > /etc/ld.so.conf.d/rocm.conf && \
  ldconfig

RUN git clone --recurse-submodules https://github.com/vosen/zluda.git
RUN cd zluda && \
    . $HOME/.cargo/env && \
    cargo xtask --release

ARG RQ_VERSION="v0.3.22"
ENV RQ_VERSION=$RQ_VERSION
COPY run.sh .
RUN wget https://github.com/Qubic-Solutions/rqiner-builds/releases/download/${RQ_VERSION}/rqiner-x86-cuda && \
    chmod +x ./rqiner-x86-cuda
ENV LD_LIBRARY_PATH=/root/zluda/target/release

CMD ["./run.sh"]
