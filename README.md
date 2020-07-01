# dromozoa-boot

## Synopsis

### fetch

```
curl -fLO https://github.com/dromozoa/dromozoa-boot/raw/master/dromozoa-boot
chmod 755 dromozoa-boot
./dromozoa-boot --list
```

### install to /opt/dromozoa

```
(cd /opt && sudo mkdir -p dromozoa dromozoa51 dromozoa52 dromozoa53)
(cd /opt && sudo chown `id -u`:`id -g` dromozoa dromozoa51 dromozoa52 dromozoa53)
./dromozoa-boot --prefix=/opt/dromozoa autoconf automake libtool screen tig zeromq libjpeg libpng hook
./dromozoa-boot --prefix=/opt/dromozoa51 lua51 luajit luarocks vim
./dromozoa-boot --prefix=/opt/dromozoa52 lua52 luarocks vim
./dromozoa-boot --prefix=/opt/dromozoa53 lua53 luarocks vim
```

### install to $HOME/prefixes/dromozoa

```
./dromozoa-boot --prefix="$HOME/prefixes/dromozoa" autoconf automake libtool screen tig zeromq libjpeg libpng hook
./dromozoa-boot --prefix="$HOME/prefixes/dromozoa51" lua51 luajit luarocks vim
./dromozoa-boot --prefix="$HOME/prefixes/dromozoa52" lua52 luarocks vim
./dromozoa-boot --prefix="$HOME/prefixes/dromozoa53" lua53 luarocks vim
```

## Packages

* [lua](https://www.lua.org/versions.html)
    * [lua51](https://dromozoa.s3.amazonaws.com/pub/index.html?prefix=pub%2Fdromozoa-autotoolize%2F1.2%2F)
    * [lua52](https://dromozoa.s3.amazonaws.com/pub/index.html?prefix=pub%2Fdromozoa-autotoolize%2F1.2%2F)
    * [lua53](https://dromozoa.s3.amazonaws.com/pub/index.html?prefix=pub%2Fdromozoa-autotoolize%2F1.2%2F)
* [luajit](https://luajit.org/download.html)
* [luarocks](https://luarocks.github.io/luarocks/releases/)
* [vim](https://github.com/vim/vim/releases)
* [autoconf](https://ftp.gnu.org/gnu/autoconf/)
* [automake](https://ftp.gnu.org/gnu/automake/)
* [libtool](https://ftp.gnu.org/gnu/libtool/)
* [screen](https://ftp.gnu.org/gnu/screen/)
* [tig](https://github.com/jonas/tig/releases)
* [zeromq](https://github.com/zeromq/libzmq/releases)
* [libjpeg](http://www.ijg.org/)
* [libpng](http://www.libpng.org/pub/png/libpng.html)
* [dromozoa](https://github.com/dromozoa/)
    * [hook](https://github.com/dromozoa/dromozoa-hook/releases/)

## Prerequisites: RHEL 6 and derivatives

```
sudo yum install gcc gcc-c++ patch zip unzip ncurses-devel readline-devel zlib-devel
```

## Prerequisites: RHEL 7 and derivatives

```
sudo yum install gcc gcc-c++ patch zip unzip ncurses-devel readline-devel zlib-devel
```

### autoconf

```
sudo yum install perl-Data-Dumper
```

### automake

```
sudo yum install perl-Thread-Queue
```

## Prerequisites: Amazon Linux 2

```
sudo yum install gcc gcc-c++ patch ncurses-devel readline-devel zlib-devel
```

### autoconf

```
sudo yum install m4 perl-Data-Dumper
```

### automake

```
sudo yum install perl-Thread-Queue
```

## Prerequisites: Raspbian Stretch Lite

```
sudo apt-get install libncursesw5-dev libreadline-dev
```

### autoconf

```
sudo apt-get install m4
```

## Prerequisites: Debian 8

```
sudo apt-get install gcc g++ curl make unzip zlib1g-dev libncursesw5-dev libreadline-dev
```
