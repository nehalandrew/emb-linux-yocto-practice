#! /bin/bash

# qemu-img create -f qcow2 virtual_bsd.img 30G
# kvm -hda virtual_bsd.img -cdrom ~/OS\'s/UNIX/FreeBSD-13.0-RELEASE-amd64-disc1.iso -m 2048 -net nic -net user -soundhw all

kvm -hda \
	virtual_bsd.img \
	-m 2048 \
	-net nic \
	-net user \
	-soundhw all \
