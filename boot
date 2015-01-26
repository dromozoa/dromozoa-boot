#! /bin/sh -e

# Copyright (C) 2015 Tomoyuki Fujimori <moyu@dromozoa.com>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with dromozoa-boot.  If not, see <http://www.gnu.org/licenses/>.

package_version=5.3.0
package_release=$package_version.dp1
package_name=lua-$package_release
package_url=https://github.com/dromozoa/lua/releases/download/v$package_release/$package_name.tar.gz

if (unset CDPATH) >/dev/null 2>&1
then
  unset CDPATH
fi

case x$PATH in
  x) PATH=/usr/bin:/bin:/usr/sbin:/sbin;;
esac
export PATH

case x$dromozoa_prefix in
  x) echo 'dromozoa_prefix is unset or null' >&2; exit 1;;
esac
dromozoa_prefix=`(cd "$dromozoa_prefix" && pwd)`
export dromozoa_prefix

PATH=$dromozoa_prefix/bin:$PATH
export PATH

case x$CPPFLAGS in
  x) CPPFLAGS="-I$dromozoa_prefix/include";;
  *) CPPFLAGS="-I$dromozoa_prefix/include $CPPFLAGS";;
esac
export CPPFLAGS

case x$LDFLAGS in
  x) LDFLAGS="-L$dromozoa_prefix/lib";;
  *) LDFLAGS="-L$dromozoa_prefix/lib $LDFLAGS";;
esac
export LDFLAGS

case x$TMPDIR in
  x) TMPDIR=/tmp;;
esac
tmp=`(umask 077 && mktemp -d "$TMPDIR/dromozoa-XXXXXX" 2>/dev/null || :)`
case x$tmp in
  x) tmp=$TMPDIR/dromozoa-$$-$RANDOM; (umask 077 && mkdir "$tmp");;
esac

cd "$tmp"
tmp=`pwd`
trap "(cd / && rm -f -r '$tmp')" 0

current_version=
if "$dromozoa_prefix/bin/lua" -v >/dev/null 2>&1
then
  current_version=`lua -v | lua -e 'io.write(io.read():match "[%.%d]+")'`
fi

if test "x$current_version" = "x$package_version"
then
  :
else
  curl -fLO "$package_url"
  gunzip -cd "$package_name.tar.gz" | tar xf -
  cd "$package_name"
  ./configure --prefix="$dromozoa_prefix"
  make
  make check
  make install
fi
