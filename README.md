# This is yocto study practice
## Install

Git clone:

```shell
git clone --recurse-submodules -j8 git@github.com:andneh/yocto_practice.git;
```

Install dependencies:

```shell
cd yocto_practice;
make prepare;
```

Build:

```shell
make bitbake;
make img;
```

## Yocto Ecosystem
- BitBake
- OpenEmbedded
- Yocto project - poky

![](./docs/img.png)

## Bitbake proces
![](./docs/bitbake.jpg)

## BB File structure

### Config 

`./conf`

`./conf/bblayers.conf`

`./conf/local.conf`

### sources

`./sources`

`./sources/meta-bsp`

`./sources/poky`

`./sources/meta-openembedded`

`./sources/meta-* `

### Build

`./build`