return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"echasnovski/mini.icons",
	},

	opts = function()
		return {
			options = {
				theme = function()
					local colorscheme = require("config.vars").colorscheme
					if colorscheme == "neopywal" then
						return "custom_neopywal"
					else
						return colorscheme
					end
				end,
				component_separators = "",
				section_separators = "",
				globalstatus = true,
			},
			sections = {
				lualine_a = {},
				lualine_b = {
					{
						"filename",
						symbols = {
							modified = "(modified)",
							readonly = "(readonly)",
							unnamed = "unnamed",
							newfile = "new",
						},
						padding = {
							left = 0,
							right = 1,
						},
					},
				},
				lualine_c = {
					"diagnostics",
				},
				lualine_x = {
					"overseer",
				},
				lualine_y = {
					"location",
				},
				lualine_z = {
					"progress",
				},
			},
		}
	end,
}
