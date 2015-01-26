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
  local result = handle:read "*a":gsub("\n+$", "")
  assert(handle:close())
  return result
end

local major, minor = assert(_VERSION:match("^Lua (%d+)%.(%d+)$"))
local version = tonumber(major) * 100 + tonumber(minor)
assert(version >= 503)

local prefix = assert(os.getenv "dromozoa_prefix")

do
  local package_version = "2.2.0"
  local package_name = "luarocks-" .. package_version
  local package_filename = package_name .. ".tar.gz"
  local package_url = "file:/Users/moyu/Downloads/" .. package_filename

  local current_version
  pcall(function ()
    current_version = eval([[%s/bin/luarocks --version 2>/dev/null]], quote(prefix)):match(" ([%.%d]+)")
  end)
  if current_version ~= package_version then
    exec([[curl -fLO %s]], quote(package_url))
    exec([[gzip -cd %s | tar xf -]], quote(package_filename))
    exec([[cd %s && ./configure --prefix=%s && make build && make install]], quote(package_name), quote(prefix))
  end
end


