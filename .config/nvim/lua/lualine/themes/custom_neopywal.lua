local M = require("neopywal.theme.plugins.lualine").get()
local C = require("neopywal.lib.palette").get_colors()

M.normal = {
  a = { bg = C.none, fg = C.color4, gui = "bold" },
  z = { bg = C.none, fg = C.color4, gui = "bold" },

  b = { bg = C.none },
  y = { bg = C.none },

  c = { bg = C.none },
  x = { bg = C.none },
}

M.visual = {
  a = { bg = C.none, fg = C.color5, gui = "bold" },
  z = { bg = C.none, fg = C.color5, gui = "bold" },
}

M.insert = {
  a = { bg = C.none, fg = C.color6, gui = "bold" },
  z = { bg = C.none, fg = C.color6, gui = "bold" },
}

M.command = {
  a = { bg = C.none, fg = C.color1, gui = "bold" },
  z = { bg = C.none, fg = C.color1, gui = "bold" },
}

M.replace = {
  a = { bg = C.none, fg = C.color2, gui = "bold" },
  z = { bg = C.none, fg = C.color2, gui = "bold" },
}

M.terminal = {
  a = { bg = C.none, fg = C.color3, gui = "bold" },
  z = { bg = C.none, fg = C.color3, gui = "bold" },
}

return M
