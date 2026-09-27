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
(cd /opt && sudo mkdir -p dromozoa dromozoa51 dromozoa52 dromozoa53 dromozoa54 dromozoa55)
(cd /opt && sudo chown `id -u`:`id -g` dromozoa dromozoa51 dromozoa52 dromozoa53 dromozoa54 dromozoa55)
./dromozoa-boot --prefix=/opt/dromozoa m4 autoconf automake libtool screen tig libsodium zeromq libjpeg libpng hook
./dromozoa-boot --prefix=/opt/dromozoa51 lua51 luajit luarocks vim
./dromozoa-boot --prefix=/opt/dromozoa52 lua52 luarocks vim
./dromozoa-boot --prefix=/opt/dromozoa53 lua53 luarocks vim
./dromozoa-boot --prefix=/opt/dromozoa54 lua54 luarocks vim
```

### install to $HOME/prefixes/dromozoa

```
./dromozoa-boot --prefix="$HOME/prefixes/dromozoa" m4 autoconf automake libtool screen tig libsodium zeromq libjpeg libpng hook
./dromozoa-boot --prefix="$HOME/prefixes/dromozoa51" lua51 luajit luarocks vim
./dromozoa-boot --prefix="$HOME/prefixes/dromozoa52" lua52 luarocks vim
./dromozoa-boot --prefix="$HOME/prefixes/dromozoa53" lua53 luarocks vim
./dromozoa-boot --prefix="$HOME/prefixes/dromozoa54" lua54 luarocks vim
```

## Packages

* [lua](https://www.lua.org/versions.html)
    * [lua51](https://dromozoa.s3.amazonaws.com/pub/index.html?prefix=pub%2Fdromozoa-autotoolize%2F1.3%2F)
    * [lua52](https://dromozoa.s3.amazonaws.com/pub/index.html?prefix=pub%2Fdromozoa-autotoolize%2F1.3%2F)
    * [lua53](https://dromozoa.s3.amazonaws.com/pub/index.html?prefix=pub%2Fdromozoa-autotoolize%2F1.3%2F)
    * [lua54](https://dromozoa.s3.amazonaws.com/pub/index.html?prefix=pub%2Fdromozoa-autotoolize%2F1.3%2F)
    * [lua55](https://dromozoa.s3.amazonaws.com/pub/index.html?prefix=pub%2Fdromozoa-autotoolize%2F1.3%2F)
* [luajit](https://luajit.org/download.html)
    * [browsable mirror](https://repo.or.cz/w/luajit-2.0.git)
    * [GitHub mirror](https://github.com/LuaJIT/LuaJIT)
* [luarocks](https://luarocks.github.io/luarocks/releases/)
* [vim](https://github.com/vim/vim/tags)
* [m4](https://ftp.gnu.org/gnu/m4/)
* [autoconf](https://ftp.gnu.org/gnu/autoconf/)
* [automake](https://ftp.gnu.org/gnu/automake/)
* [libtool](https://ftp.gnu.org/gnu/libtool/)
* [screen](https://ftp.gnu.org/gnu/screen/)
* [tig](https://github.com/jonas/tig/releases)
* [libsodium](https://download.libsodium.org/libsodium/releases/)
* [zeromq](https://github.com/zeromq/libzmq/releases)
* [libjpeg](http://www.ijg.org/)
* [libpng](http://www.libpng.org/pub/png/libpng.html)
* [dromozoa](https://github.com/dromozoa/)
    * [hook](https://github.com/dromozoa/dromozoa-hook/releases/)

## Prerequisites: Ubuntu 26.04 / Raspberry Pi OS (Debian Trixie)

```
sudo apt install gcc g++ make unzip libcrypt-dev libncurses-dev libpam0g-dev libreadline-dev zlib1g-dev
```

## Prerequisites: RHEL 10 and derivatives

```
sudo dnf install gcc gcc-c++ patch unzip ncurses-devel readline-devel pam-devel zlib-devel perl-File-Compare perl-File-Copy perl-Thread-Queue
```
