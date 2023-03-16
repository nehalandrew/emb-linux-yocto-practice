#! /bin/bash

source sources/poky/oe-init-build-env build;
	cp -r ../conf ./;
	bitbake-layers show-layers;