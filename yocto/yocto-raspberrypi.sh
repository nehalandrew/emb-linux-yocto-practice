#! /bin/bash

########################################################################
##                                   Poky version name                ##
########################################################################

readonly BRANCHNAME=honister;

########################################################################
##                                   System Dependiences              ##
########################################################################

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

echo "
!!!    PYTHON3 MUST HAVE ASLIAS AS PYTHON IN ~/.bashrc    !!!";
sleep 30;

########################################################################
##                                   Meta-layers                      ##
########################################################################

cd sources;

# Poky
git clone -b $BRANCHNAME git://git.yoctoproject.org/poky.git;

# Meta-raspberrypi BSP layer
git clone -b $BRANCHNAME git://git@github.com:agherzan/meta-raspberrypi.git;

# Meta-openembedded dependiences layer
git clone -b $BRANCHNAME git://git.openembedded.org/meta-openembedded;

cd ..;

########################################################################
##                                   Set build env                    ##
########################################################################

source sources/poky/oe-init-build-env rpi64-build;
cp -r ../conf ./;
bitbake-layers show-layers;

echo "
OPTIONAL CMD:
bitbake -c menuconfig virtual/kernel
";
# bitbake -c menuconfig virtual/kernel;

echo "
RUN FOLLOWING COMMAND:
source sources/poky/oe-init-build-env rpi64-build";