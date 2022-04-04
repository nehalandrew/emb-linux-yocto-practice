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
    python3-distutils \
    texinfo \
    zstd \
    liblz4-tool;

echo "
!!!    PYTHON3 MUST HAVE ASLIAS AS PYTHON IN ~/.bashrc    !!!";
sleep 30;

########################################################################
##                                   Meta-layers                      ##
########################################################################

# Poky
git clone -b $BRANCHNAME git://git.yoctoproject.org/poky.git;

# Meta-raspberrypi BSP layer
git clone -b $BRANCHNAME git://git@github.com:agherzan/meta-raspberrypi.git;

# Meta-openembedded dependiences layer
git clone -b $BRANCHNAME git://git.openembedded.org/meta-openembedded;

########################################################################
##                                   Set build env                    ##
########################################################################

source poky/oe-init-build-env build-rpi64;
cp -r ../conf ./;
bitbake-layers show-layers;

echo "
OPTIONAL CMD:
bitbake -c menuconfig virtual/kernel
";
bitbake -c menuconfig virtual/kernel;

echo "
RUN FOLLOWING COMMAND:
source poky/oe-init-build-env build-rpi64";