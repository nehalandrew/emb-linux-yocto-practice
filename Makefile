apt:
	sudo apt update;
	sudo apt full-upgrade -y;
	sudo apt install -y \
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
env:
	source .env;

git:
	make env;
	git submodule foreach git checkout ${version};

build_env:
	source sources/poky/oe-init-build-env rpi64-build;
	cp -r ../conf ./;
	bitbake-layers show-layers;
	echo "\nOPTIONAL CMD:\nbitbake -c menuconfig virtual/kernel\n";
	# bitbake -c menuconfig virtual/kernel;

prepare:
	make apt;
	make git;

build:
	source sources/poky/oe-init-build-env rpi64-build";