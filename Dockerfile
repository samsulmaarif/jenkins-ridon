FROM ubuntu:16.04
MAINTAINER Ridon Infrastructure Team <infra@ridon.id>

ENV DEBIAN_FRONTEND noninteractive

#build tools
RUN apt-get update && apt-get -y --no-install-recommends install \
    openjdk-8-jdk \
    python \
    bc \
    yasm \
    rsync \
    schedtool \
    imagemagick \
    git-core \
    gnupg \
    flex \
    bison \
    gperf \
    build-essential \
    zip \
    curl \
    zlib1g-dev \
    gcc-multilib \
    g++-multilib \
    libc6-dev-i386 \
    lib32ncurses5-dev \
    x11proto-core-dev \
    libx11-dev \
    lib32z-dev \
    libssl-dev \
    ccache \
    libgl1-mesa-dev \
    libxml2-utils \
    xsltproc \
    unzip \
    openssh-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/*

ADD https://commondatastorage.googleapis.com/git-repo-downloads/repo /usr/local/bin/
RUN chmod 755 /usr/local/bin/*

RUN useradd -d /ridon -ms /bin/bash -g root -G sudo -p ridon ridon
USER ridon
WORKDIR /ridon/

VOLUME /ridon/
VOLUME /ccache/
