#! /bin/bash

# setup
sudo apt update
sudo apt install -y gawk wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev python3-subunit mesa-common-dev zstd liblz4-tool file locales
sudo apt full-upgrade -y
sudo locale-gen en_US.UTF-8

git submodule update --init --recursive

# env 
source sources/poky/oe-init-build-env build

# mkdir sources/poky/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/raspberrypi3

# build
bitbake core-image-sato

# test
runqemu qemux86-64