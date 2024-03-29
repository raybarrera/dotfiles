require('raybarrera.base')
require('raybarrera.highlights')
require('raybarrera.maps')
require('raybarrera.plugins')
require('raybarrera.filetype')

local has = function(x)
    return vim.fn.has(x) == 1
end

local is_mac = has "macunix"
local is_win = has "win32"

--if is_mac then
  --  require('macos')
--end
--if is_win then
  --  require('windows')
--end

