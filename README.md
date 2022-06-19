# Embedded developer requirements
- bare metal:
	- [ ] real time os
	- [ ] sensors
	- [ ] I2C SPI UART I2S USB PCI modbus
	- [ ] bluetooth 
	- [ ] RAM RAID 
	- [ ] MCU MPU SoC

- Kernel-space development:
	- understanding Linux startup
    	- [ ] bootloader 
    	- [ ] kernel 
    	- [ ] root file system
	- [ ] man dtc DTB dev tree
	- [ ] kernel module development BSP conf build use
	- [ ] build kernel for ur laptop
	- [ ] linux system calls
	- [ ] LFS
	- [ ] yocto 
	- [ ] QT GTK+ 
	- [ ] opencl openmp CUDA (paralel)

- Users-space development:
	- [ ] gcc gdb makefile autoconf lauterbach
	- [ ] linux system administration tools ans utils
	- [ ] Clang rust python
	- [ ] multimedia

---

# Embedded developer knowledge

## How linux startups:
```
->	EFI			BIOS
->	grub2(500)		GRUB(in 500MB)
->	/boot/grub2		GRUB2
```
```
->	/boot/*.dtb		device-tree-blob for embedded
+	/boot/initrd.img	initial ramdisk
+	/boot/vmlinuz		zipped kernel
->	kthreadd		kernel thread daemon
```
```
+	/usr/sbin/init		systemd (ln /usr/lib/systemd/systemd)
->	pstree			daemons
```
![picture](./linux_boot.dio.svg)

## monolithic kernel structure:
- device tree
- drivers
- managers:
	- Memory
	- Process
	- virtual fs
	- IPC
	- IO
	- Network
- system call interface

## rootfs + boot:
### Kernel space (DTB + kernel + rootfs)
```
/boot	- BOOT, *.dtb, vmlinuz, initd.img
/dev	- devices
/sys	- devices drivers kernel...
/proc	- proces like files
```
### User space (daemon + bins + libs)
```
/usr	- unix system resource bins libs
/etc	- configs for bins
/srv	- rules for sites
```
#### Daemons and programs files
```
/run	- runtime var dir for daemons
/tmp	- short time var file
/var	- long time var files like run tmp..
```

#### Users files
```
/root 	- root home
/home 	- users home
```

## The systemd startup map: 
``` bash
pstree
```