local M = require("neopywal.theme.plugins.lualine").get()
local C = require("neopywal.lib.palette").get_colors()

M.normal = {
  a = { bg = C.none, fg = C.color4 },
  z = { bg = C.none, fg = C.color4 },

  b = { bg = C.none },
  y = { bg = C.none },

  c = { bg = C.none },
  x = { bg = C.none },
}

M.visual = {
  a = { bg = C.none, fg = C.color5 },
  z = { bg = C.none, fg = C.color5 },
}

M.insert = {
  a = { bg = C.none, fg = C.color6 },
  z = { bg = C.none, fg = C.color6 },
}

M.command = {
  a = { bg = C.none, fg = C.color1 },
  z = { bg = C.none, fg = C.color1 },
}

M.replace = {
  a = { bg = C.none, fg = C.color2 },
  z = { bg = C.none, fg = C.color2 },
}

M.terminal = {
  a = { bg = C.none, fg = C.color3 },
  z = { bg = C.none, fg = C.color3 },
}

return M
