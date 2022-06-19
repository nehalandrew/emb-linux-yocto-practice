
:, [19.06.22 04:35]
man dtc

:, [19.06.22 15:39]
Users space development
gcc gdb makefile autoconf 

understanding Linux startup
bootloader kernel root file system
linux system calls

linux system administration tools ans utils

LFS

kernel module development BSP 
conf build use

build kernell for ur laptop

:, [19.06.22 15:41]
Clang
real time
I2C SPI UART I2S USB PCI modbus
sensors
bluetooth
RAM RAID 
yocto
multimedia
MCU MPU
QT GTK+
opencl openmp CUDA (parralel)






![picture](./linux_boot.dio.svg)

```
EFI ->                                        bios
grub2(500) ->                          grub
/boot/grub2 ->                          |

/boot/vmlinuxz +                   kernel
.dtb  +                                     device-tree-blob for embdd
/boot/initrd.img ->                 initial ramdisk
kthreadd +                            kernel thread daemon

/usr/sbin/init >(/usr/lib/systemd/systemd) ->     systemd
pstree
```
The systemd startup map: 

```
pstree
```
```
   local-fs-pre.target
            |
            v
   (various mounts and   (various swap   (various cryptsetup
    fsck services...)     devices...)        devices...)       (various low-level   (various low-level
            |                  |                  |             services: udevd,     API VFS mounts:
            v                  v                  v             tmpfiles, random     mqueue, configfs,
     local-fs.target      swap.target     cryptsetup.target    seed, sysctl, ...)      debugfs, ...)
            |                  |                  |                    |                    |
            \__________________|_________________ | ___________________|____________________/
                                                 \|/
                                                  v
                                           sysinit.target
                                                  |
             ____________________________________/|\________________________________________
            /                  |                  |                    |                    \
            |                  |                  |                    |                    |
            v                  v                  |                    v                    v
        (various           (various               |                (various          rescue.service
       timers...)          paths...)              |               sockets...)               |
            |                  |                  |                    |                    v
            v                  v                  |                    v              rescue.target
      timers.target      paths.target             |             sockets.target
            |                  |                  |                    |
            v                  \_________________ | ___________________/
                                                 \|/
                                                  v
                                            basic.target
                                                  |
             ____________________________________/|                                 emergency.service
            /                  |                  |                                         |
            |                  |                  |                                         v
            v                  v                  v                                 emergency.target
        display-        (various system    (various system
    manager.service         services           services)
            |             required for            |
            |            graphical UIs)           v
            |                  |           multi-user.target
            |                  |                  |
            \_________________ | _________________/
                              \|/
                               v
                     graphical.target
```