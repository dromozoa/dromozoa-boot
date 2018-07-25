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
  expr  "X$1" : 'X.*\(/[^/][^/]*\)/*$' \
    '|' "X$1" : '\(X//\)$' \
    '|' "X$1" : '\(X/\)' \
    '|' "X$1" | sed 's/^.//'
}

dromozoa_dirname() {
  expr  "X$1" : '\(X.*[^/]\)//*[^/][^/]*/*$' \
    '|' "X$1" : '\(X//\)[^/]' \
    '|' "X$1" : '\(X//\)$' \
    '|' "X$1" : '\(X/\)' \
    '|' X. | sed 's/^.//'
}

dromozoa_check() {
  result=`dromozoa_dirname "$1"`
  if test "X$result" = "X$2"
  then
    :
  else
    echo "error: dromozoa_dirname '$1' ('$result' != '$2')" >&2
  fi
  result=`dromozoa_basename "$1"`
  if test "X$result" = "X$3"
  then
    :
  else
    echo "error: dromozoa_basename '$1' ('$result' != '$2')" >&2
  fi
}

dromozoa_check /usr/lib /usr lib
dromozoa_check /usr/    /    usr
dromozoa_check usr      .    usr
dromozoa_check /        /    /
dromozoa_check .        .    .
dromozoa_check ..       .    ..
dromozoa_check /00/000  /00  000
dromozoa_check 000/000  000  000

case X`echo foo bar baz` in
  Xfoo*baz) ;;
  *) echo error;;
esac

dromozoa_search() {
  path=:$PATH
  while :
  do
    i=`expr "X$path" : 'X\(:[^:]*\)' | sed 's/^.//'`
    case X$i in
      X) i=.;;
    esac
    for j in "$@"
    do
      if test -x "$i/$j"
      then
        i=`(cd "$i" && pwd)`
        echo "$i/$j"
        return
      fi
    done
    path=`expr "X$path" : 'X:[^:]*\(:.*\)' '|' X`
    case X$path in
      XX) return;;
    esac
  done
}

path_save=$PATH
PATH=$PATH::.
export PATH

result=`dromozoa_search lua`
case X$result in
  X*/lua) ;;
  *) echo "error dromozoa_search 'lua'" >&2;;
esac
# lua_prefix=/var/tmp/prefix/bin
lua_prefix=`dromozoa_dirname "$result"`
lua_prefix=`expr "X$lua_prefix" : '\(X.*\)/bin$' '|' "X$lua_prefix" | sed 's/^.//'`
echo "$lua_prefix"

result=`dromozoa_search vim`
case X$result in
  X*/vim) ;;
  *) echo "error dromozoa_search 'vim'" >&2;;
esac
result=`dromozoa_search no-such-command`
case X$result in
  X) ;;
  *) echo "error dromozoa_search 'no-such-command'" >&2;;
esac
dromozoa_search luajit lua

printf 'foo\nb a r\n baz \n' | while read item
do
  echo "[$item]"
done

PATH=$path_save
export PATH

result=`printf 'tig version 2.4.0\nncurses version 5.7.20081102\n'`
result=`expr "X$result" : 'X.*\([ v][0-9][0-9]*\.[0-9][0-9.]*\)' | sed 's/^.//'`
echo "$result"
