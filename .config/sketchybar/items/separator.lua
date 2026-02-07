local colors = require("colors")

return function(side)
	sbar.add("item", "separator" .. math.random(10000), {
		label = {
			string = "----",
			color = colors.icon,
		},
		position = side,
		padding_left = 10,
		padding_right = 10,
	})
end
