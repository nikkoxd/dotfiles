local colors = require("colors")
local settings = require("settings")

sbar.bar({
  color = colors.bar.bg,
  border_color = colors.bar.border,
  border_width = settings.bar.border,
  blur_radius = settings.bar.blur,
  position = settings.bar.position,
  height = settings.bar.height,
  margin = settings.bar.margin,
  y_offset = settings.bar.offset,
  padding_left = 10,
  padding_right = 10,
  corner_radius = 0,
  shadow = false,
  topmost = false,
})
