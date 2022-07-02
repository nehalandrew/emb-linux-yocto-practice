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
	- [ ] build kernel for ur laptop~
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
1. Get computer systems understanding
   1. Resource: Computer Systems : Application programmers perspective(book) is all you will need for this.
2. Get understanding of how Operating Systems work (Process, Management, File Management, Memory management)
   1. Resource:Operating System Concepts (book) by Galvin and others
3. C
   1. Get really good at C programming. (Function, Pointers, Arrays, Structures, Bit-wise operations should be your best friends)
      1. Resource: C in Depth by Srivastava and The C Programming Language by K & R
   2. Get good at Embedded C
4. Linux Programming
   1. Resource: Linux Programming interface(book)
5. Embedded Linux and porting (Get a reference platform(raspberry pi or beaglebone black) and start experimenting what you have learnt.
   1. Resource: Embedded Linux Primer(book). Also both RPi and BBB have excellent documentation, support and forums.
6. Pick a sensor interface it with your reference platform.
   1. Resource: Sensor Datasheet, google, stackoverflow and forums.
7. Learn about interfaces and drivers (Video, audio, I2C, SPI etc)
   1. Resource: Some sensor datasheet have good explanation of the interfaces, google, stackoverflow and forums. For Device Drivers, LDD (book) and Essentials Linux Device Drivers(book).
8. If you are able to reach here, well you will be a pretty darn good Embedded System Developer.
   1. Many will/may argue about some of the steps mentioned above and their relevance, but I would suggest you check each one of them.
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
+	/boot/vmlinuz		zipped kernel
+	/boot/initrd.img	initial ramdisk
->	kthreadd		kernel thread daemon
```
```
+	/usr/sbin/init		systemd (ln /usr/lib/systemd/systemd)
->	/
->	Network
->	pstree			daemons
```
![picture](./linux_boot.dio.svg)

## GRUB2 cli
```
linux /vmlinuz root=UUID=... # (='h0,_') (=/dev/sda)
initrd /initrd.img
boot
```

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


