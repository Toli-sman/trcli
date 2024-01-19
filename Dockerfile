ARG PYTHON_VERSION='3.12-slim-bookworm'
FROM python:${PYTHON_VERSION}

LABEL description="Docker image with latest TastRail CLI tool"
LABEL link="https://github.com/Toli-sman/trcli.git"
LABEL maintainer="Github: Tolisman"
LABEL trcli_version="1.8.0"
LABEL python_version="${PYTHON_VERSION}"

ARG DEBIAN_FRONTEND="noninteractive"
ARG USER="developer"
ARG HOME="/home/${USER}"
ARG WORK_DIR="${HOME}/build"

USER root

ENV TZ=Europe/Kiev
ENV LANG en_US.UTF-8

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gawk \
    curl \
    wget \
    git \
    build-essential \
    zlib1g-dev \
    libncurses5-dev \
    libgdbm-dev \
    libnss3-dev \
    libssl-dev \
    libreadline-dev \
    libffi-dev \
    libsqlite3-dev \
    libbz2-dev \
    sudo \
    locales \
    apt-utils \
    rsync \
    pkg-config \
    build-essential \
    xterm \
    junit \
    bc \
    vim \
    nano \
    file \
    ca-certificates \
    && apt-get -y clean \
    && apt-get -y autoremove --purge \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8
RUN groupadd -g 1000 "${USER}" \
    && useradd -m -r -s /bin/bash -g root -u 1000 -G adm,disk,users,sudo,"${USER}" "${USER}" \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN python -m pip install --upgrade pip \
    && pip install trcli

USER "$USER"
WORKDIR "$WORK_DIR"

CMD ["/bin/bash"]
