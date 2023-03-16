#! /bin/bash

apt update;
	apt full-upgrade -y;
	apt install -y \
    	build-essential \
    	python3 \
    	python3-pip \
    	chrpath \
    	diffstat \
    	gawk \
    	libncurses5-dev \
    	ncurses-dev \
    	python3-distutils \
    	texinfo \
    	zstd \
    	wget \
    	git \
    	gcc-multilib \
    	socat \
    	lzop \
    	libsdl1.2-dev \
    	liblz4-tool;