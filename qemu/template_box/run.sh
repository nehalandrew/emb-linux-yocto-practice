#! /bin/bash

# qemu-img create -f qcow2 virtual_*.img 30G
# kvm -hda virtual_*.img -cdrom ./*.iso -m 2048 -net nic -net user -soundhw all

/usr/bin/qemu-system-x86_64 \
	-hda $(ls ./virtual_*.img) \
	-m 2048 \
	-soundhw all \
	-name vserialtest \
	-chardev socket,path=/tmp/port1,server,nowait,id=port1-char \
	-device virtio-serial \
	-device virtserialport,id=port1,chardev=port1-char,name=org.fedoraproject.port.0 \
	-net nic \
	-net user,hostfwd=tcp::10022-:22,hostfwd=tcp::10080-:80 \
	;
