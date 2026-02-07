local settings = require("settings")
local colors = require("colors")

sbar.default({
  padding_left = 5,
  padding_right = 5,
  background = {
    image = {
      drawing = "on"
    }
  },
	icon = {
    drawing = "off",
		font = {
			family = settings.fonts.icon,
			style = "Regular",
			size = 12,
		},
    color = colors.icon,
    padding_right = 5,
	},
	label = {
		font = {
			family = settings.fonts.text,
			style = "Regular",
			size = 14,
		},
		color = colors.text,
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
