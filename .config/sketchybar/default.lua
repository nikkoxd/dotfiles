local settings = require("settings")
local colors = require("colors")

sbar.default({
  padding_left = 5,
  padding_right = 5,
  y_offset = 1,
  background = {
    height = 21,
    image = {
      drawing = "on"
    },
  },
	icon = {
    drawing = "off",
		font = {
			family = settings.icon.font,
			style = "Regular",
			size = settings.icon.size,
		},
    color = colors.icon,
    padding_right = 5,
	},
	label = {
		font = {
			family = settings.text.font,
			style = "Regular",
			size = settings.text.size,
		},
    y_offset = 1,
		color = colors.text.normal,
	},
  popup = {
    background = {
      color = colors.bar.bg,
      border_color = colors.bar.border,
      border_width = 1,
      corner_radius = 10,
    },
  }
})
