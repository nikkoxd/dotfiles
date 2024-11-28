local M = require("neopywal.theme.plugins.lualine").get()
local C = require("neopywal.lib.palette").get_colors()
local U = require("neopywal.utils.color")

M.normal = {
  a = { bg = C.color4, fg = C.background, gui = "bold" },
  z = { bg = C.color4, fg = C.background, gui = "bold" },

  b = { bg = C.color0 },
  y = { bg = C.color0 },

  c = { bg = U.darken(C.background, 5) },
  x = { bg = U.darken(C.background, 5) },
}

return M
