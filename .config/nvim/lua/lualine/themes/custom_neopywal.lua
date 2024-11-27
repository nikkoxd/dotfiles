local M = require("neopywal.theme.plugins.lualine").get()
local C = require("neopywal.lib.palette").get_colors()

M.normal = {
  a = { bg = C.color4, fg = C.background, gui = "bold" },
  z = { bg = C.color4, fg = C.background, gui = "bold" },

  b = { bg = C.color0 },
  y = { bg = C.color0 },

  c = { bg = C.none },
  x = { bg = C.none },
}

return M
