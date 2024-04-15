FROM ubuntu:22.04 as build

WORKDIR /root

RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
  ca-certificates \
  wget \
  curl \
  gnupg \
  build-essential \
  cmake \
  git
ENV PATH="${PATH}:/opt/rocm/bin:/opt/rocm/llvm/bin"

ARG ROCM_VERSION=5.7.3
RUN echo "Package: *\nPin: release o=repo.radeon.com\nPin-Priority: 600" > /etc/apt/preferences.d/rocm-pin-600 && \
  mkdir --parents --mode=0755 /etc/apt/keyrings && \
  sh -c 'wget https://repo.radeon.com/rocm/rocm.gpg.key -O - |  gpg --dearmor | tee /etc/apt/keyrings/rocm.gpg > /dev/null' && \
  sh -c 'echo deb [arch=amd64 signed-by=/etc/apt/keyrings/rocm.gpg] https://repo.radeon.com/rocm/apt/${ROCM_VERSION} jammy main > /etc/apt/sources.list.d/rocm.list' && \
  apt update && DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
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

ARG RUST_VERSION=1.77.1
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain=${RUST_VERSION} && \
  . $HOME/.cargo/env && cargo install bindgen-cli --locked

RUN git clone --recurse-submodules https://github.com/vosen/zluda.git && \
  cd zluda && \
  . $HOME/.cargo/env && \
  cargo xtask --release

FROM ubuntu:22.04 as app

WORKDIR /root
COPY --from=build /root/zluda/target/release /root/zluda

ARG ROCM_VERSION=5.7.3
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends ca-certificates wget gnupg && \
  echo "Package: *\nPin: release o=repo.radeon.com\nPin-Priority: 600" > /etc/apt/preferences.d/rocm-pin-600 && \
  mkdir --parents --mode=0755 /etc/apt/keyrings && \
  sh -c 'wget https://repo.radeon.com/rocm/rocm.gpg.key -O - |  gpg --dearmor | tee /etc/apt/keyrings/rocm.gpg > /dev/null' && \
  sh -c 'echo deb [arch=amd64 signed-by=/etc/apt/keyrings/rocm.gpg] https://repo.radeon.com/rocm/apt/${ROCM_VERSION} jammy main > /etc/apt/sources.list.d/rocm.list' && \
  apt update && DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
  hip-runtime-amd && \
  echo 'export PATH="$PATH:/opt/rocm/bin"' > /etc/profile.d/rocm.sh && \
  echo '/opt/rocm/lib' > /etc/ld.so.conf.d/rocm.conf && \
  ldconfig

ARG RQ_VERSION="v0.4.1"
COPY run.sh .
RUN wget https://github.com/Qubic-Solutions/rqiner-gpu-builds/releases/download/${RQ_VERSION}/rqiner-x86-cuda && \
  chmod +x ./rqiner-x86-cuda

CMD ["./run.sh"]
