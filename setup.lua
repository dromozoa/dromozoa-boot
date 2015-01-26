#! /usr/bin/env lua

-- Copyright (C) 2015 Tomoyuki Fujimori <moyu@dromozoa.com>
--
-- This file is part of dromozoa-boot.
--
-- dromozoa-boot is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- dromozoa-boot is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with dromozoa-boot.  If not, see <http://www.gnu.org/licenses/>.

local quote
do
  local Q = [[']]
  local E = [[\']]
  local QEQ = Q .. E .. Q
  local EQQ = E .. Q .. E
  local QQE = Q .. Q .. E
  quote = function (v)
    return ((Q .. v:gsub(Q, QEQ) .. Q):gsub(EQQ, E):gsub(QQE, E))
  end
end

local function exec(...)
  assert(os.execute(string.format(...)))
end

local function eval(...)
  local handle = assert(io.popen(string.format(...)))
  local result = handle:read("*a"):gsub("\n+$", "")
  assert(handle:close())
  return result
end

local function gnu_version(command)
  local result = eval("%s --version 2>/dev/null || :", quote(command))
  if result:match("Free Software Foundation, Inc%.") then
    return result:match "[^\n]*":match "[%.%d]+$"
  else
    return nil
  end
end

local function fetch(url)
  local filename = assert(url:match("/([^/]+)$"))
  exec("curl -fLO %s", quote(url))
  exec("gzip -cd %s | tar xf -", quote(filename))
end

local function build(name, script)
  if script == nil then
    script = "./configure --prefix=\"$dromozoa_prefix\" && make && make install"
  end
  exec("cd %s && %s", quote(name), script)
end

local major, minor = assert(_VERSION:match("^Lua (%d+)%.(%d+)$"))
local version = tonumber(major) * 100 + tonumber(minor)
assert(version >= 503)

do
  local package_version = "2.2.0"
  local package_name = "luarocks-" .. package_version
  local package_url = "file:/Users/moyu/Downloads/" .. package_name .. ".tar.gz"

  local current_version = eval("\"$dromozoa_prefix/bin/luarocks\" --version 2>/dev/null || :"):match(" ([%.%d]+)")
  if current_version ~= package_version then
    fetch(package_url)
    build(package_name, "./configure --prefix=\"$dromozoa_prefix\" && make build && make install")
  end
end

do
  local current_version = eval("perl -v 2>/dev/null || :"):match("v([%.%d]+)")
  print("perl", current_version)
end

do
  local current_version = gnu_version "m4"
  print("GNU m4", current_version)
end

do
  local package_version = "2.69"
  local package_name = "autoconf-" .. package_version
  local package_url = "file:///Users/moyu/Downloads/" .. package_name .. ".tar.gz"

  local current_version = gnu_version "autoconf"
  print("GNU autoconf", current_version)
  if current_version ~= package_version then
    fetch(package_url)
    build(package_name)
  end
end

do
  local package_version = "1.15"
  local package_name = "automake-" .. package_version
  local package_url = "file:///Users/moyu/Downloads/" .. package_name .. ".tar.gz"

  local current_version = gnu_version "automake"
  print("GNU automake", current_version)
  if current_version ~= package_version then
    fetch(package_url)
    build(package_name)
  end
end

do
  local package_version = "2.4.5"
  local package_name = "libtool-" .. package_version
  local package_url = "file:///Users/moyu/Downloads/" .. package_name .. ".tar.gz"

  local current_version = gnu_version "libtool"
  print("GNU libtool", current_version)
  if current_version ~= package_version then
    fetch(package_url)
    build(package_name)
  end
end
