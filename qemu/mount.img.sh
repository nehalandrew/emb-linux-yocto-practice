sudo modprobe nbd max_part=8
sudo qemu-nbd --connect=/dev/nbd0 ~/projects/embedded_linux/qemu/debian_box/virtual_debian.img
sudo qemu-nbd --disconnect /dev/nbd0