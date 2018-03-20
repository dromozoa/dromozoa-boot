#! /bin/sh -e

# Copyright (C) 2017,2018 Tomoyuki Fujimori <moyu@dromozoa.com>
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

dromozoa_basename() {
  expr  "X$1" : 'X.*/\([^/][^/]*\)/*$' \
    '|' "X$1" : 'X\(//\)$' \
    '|' "X$1" : 'X\(/\)' \
    '|' "X$1" : 'X\(.*\)'
}

dromozoa_dirname() {
  expr "x$1" : 'x\(.*[^/]\)//*[^/][^/]*/*$' \
    '|' "x$1" : 'x\(//\)[^/]' \
    '|' "x$1" : 'x\(//\)$' \
    '|' "x$1" : 'x\(/\)' \
    '|' .
}

dromozoa_check() {
  result=`dromozoa_dirname "$1"`
  test "x$result" = "x$2" || echo "error: dirname($1) $result != $2"
  result=`dromozoa_basename "$1"`
  test "x$result" = "x$3" || echo "error: basename($1) $result != $3"
}

dromozoa_check /usr/lib /usr lib
dromozoa_check /usr/    /    usr
dromozoa_check usr      .    usr
dromozoa_check /        /    /
dromozoa_check .        .    .
dromozoa_check ..       .    ..

case x`echo foo bar baz` in
  xfoo*baz) ;;
  *) echo error;;
esac

dromozoa_search() {
  path=:$PATH
  while :
  do
    i=`expr "x$path" : 'x:\([^:]*\)' '|' .`
    echo "[$i]"
    for j in "$@"
    do
      if test -x "$i/$j"
      then
        i=`(cd "$i" && pwd)`
        echo "$i/$j"
        return
      fi
    done
    if expr "x$path" : 'x:[^:]*$' >/dev/null 2>&1
    then
      return
    fi
    path=`expr "x$path" : 'x:[^:]*\(.*\)'`
  done
}

path_save=$PATH
PATH=$PATH::.
export PATH

dromozoa_search lua
dromozoa_search vim
dromozoa_search no-such-command

PATH=$path_save
export PATH
