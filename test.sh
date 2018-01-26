#! /bin/sh -e

# Copyright (C) 2017 Tomoyuki Fujimori <moyu@dromozoa.com>
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

fn_basename() {
  expr "x$1" : 'x.*/\([^/][^/]*\)/*$' \
    '|' "x$1" : 'x\(//\)$' \
    '|' "x$1" : 'x\(/\)' \
    '|' "x$1" : 'x\(.*\)'
}

fn_dirname() {
  expr "x$1" : 'x\(.*[^/]\)//*[^/][^/]*/*$' \
    '|' "x$1" : 'x\(//\)[^/]' \
    '|' "x$1" : 'x\(//\)$' \
    '|' "x$1" : 'x\(/\)' \
    '|' .
}

fn_check() {
  result=`fn_dirname "$1"`
  test "x$result" = "x$2" || echo "error: dirname($1) $result != $2"
  result=`fn_basename "$1"`
  test "x$result" = "x$3" || echo "error: basename($1) $result != $3"
}

fn_check /usr/lib /usr lib
fn_check /usr/    /    usr
fn_check usr      .    usr
fn_check /        /    /
fn_check .        .    .
fn_check ..       .    ..

case x`echo foo bar baz` in
  xfoo*baz) ;;
  *) echo error;;
esac
