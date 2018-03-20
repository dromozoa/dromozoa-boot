#! /bin/sh

# Copyright (C) 2018 Tomoyuki Fujimori <moyu@dromozoa.com>
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

check_expr() {
  result=`expr "X$1" : 'X\([0-9a-z]*\)'`
  expr "X$1" : 'X\([0-9a-z]*\)' >/dev/null 2>&1
  status=$?

  echo "<tr>"
  case x$1 in
    x) echo "  <td>空文字列</td>";;
    *) echo "  <td><code>$1</code></td>";;
  esac
  case x$result in
    x) echo "  <td>空文字列</td>";;
    *) echo "  <td><code>$result</code></td>";;
  esac
  echo "  <td><code>$status</code></td>"
  echo "</tr>"
}

check_expr ""
check_expr "foo"
check_expr "BAR"
check_expr "0"
check_expr "0000"
check_expr "0x00"
