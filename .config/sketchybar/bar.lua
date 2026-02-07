local colors = require("colors")

sbar.bar({
  color = colors.bar.bg,
  border_color = colors.bar.border,
  border_width = 1,
  blur_radius = 50,
  position = "left",
  height = 60,
  margin = 5,
  y_offset = 10,
  corner_radius = 10,
  shadow = true,
  topmost = true,
})
