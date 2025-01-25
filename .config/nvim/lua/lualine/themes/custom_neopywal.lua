local M = require("neopywal.theme.plugins.lualine").get()
local C = require("neopywal").get_colors()

M.normal = {
  a = { bg = C.color4, fg = C.color0 },
  z = { bg = C.color4, fg = C.color0 },

  b = { bg = C.color0 },
  y = { bg = C.color0 },

  c = { bg = C.none },
  x = { bg = C.none },
}

M.visual = {
  a = { bg = C.color5, fg = C.color0 },
  z = { bg = C.color5, fg = C.color0 },
}

M.insert = {
  a = { bg = C.color6, fg = C.color0 },
  z = { bg = C.color6, fg = C.color0 },
}

M.command = {
  a = { bg = C.color1, fg = C.color0 },
  z = { bg = C.color1, fg = C.color0 },
}

M.replace = {
  a = { bg = C.color2, fg = C.color0 },
  z = { bg = C.color2, fg = C.color0 },
}

M.terminal = {
  a = { bg = C.color3, fg = C.color0 },
  z = { bg = C.color3, fg = C.color0 },
}

return M
