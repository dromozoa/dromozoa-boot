#! /bin/sh -e

# Copyright (C) 2018,2020,2021,2023,2024 Tomoyuki Fujimori <moyu@dromozoa.com>
#
# This file is part of dromozoa-boot.
#
# dromozoa-boot is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# dromozoa-boot is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with dromozoa-boot. If not, see <https://www.gnu.org/licenses/>.

./dromozoa-boot --prefix=/opt/dromozoa m4 autoconf automake libtool bison screen tig libsodium zeromq libjpeg libpng hook
./dromozoa-boot --prefix=/opt/dromozoa51 lua51 luajit luarocks vim
./dromozoa-boot --prefix=/opt/dromozoa52 lua52 luarocks vim
./dromozoa-boot --prefix=/opt/dromozoa53 lua53 luarocks vim
./dromozoa-boot --prefix=/opt/dromozoa54 lua54 luarocks vim
