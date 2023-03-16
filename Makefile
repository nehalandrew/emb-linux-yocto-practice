SHELL := /bin/bash

apt:
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
git:
	source .env & git submodule foreach git checkout ${version};
	source .env & git submodule foreach git pull;
prepare:
	make apt;
	make git;
bbenv:
	source sources/poky/oe-init-build-env build;
	cp -r ../conf ./;
	bitbake-layers show-layers;
menu:
	bitbake -c menuconfig virtual/kernel;
bb:
	make build_env;
	source sources/poky/oe-init-build-env rpi64-build;