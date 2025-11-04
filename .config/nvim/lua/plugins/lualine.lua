return {
	"nvim-lualine/lualine.nvim",
    -- enabled = false,
	dependencies = {
		"echasnovski/mini.icons",
	},
	opts = function()
		require("mini.icons").mock_nvim_web_devicons()

		return {
			options = {
                theme = "neopywal",
				component_separators = "",
				section_separators = "",
				globalstatus = true,
			},
			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{
						"mode",
						fmt = function(s)
							if s == "V-LINE" then
								s = "l"
							end
							return string.lower(s):sub(1, 1)
						end,
					},
					{
						"filename",
						symbols = {
							modified = "(modified)",
							readonly = "(readonly)",
							unnamed = "unnamed",
							newfile = "new",
						},
					},
					"diagnostics",
				},
				lualine_x = {
					"overseer",
					{
						"branch",
						icon = { "" },
					},
					{
						"progress",
						fmt = function(s)
							return string.lower(s)
						end,
					},
					"location",
				},
				lualine_y = {},
				lualine_z = {},
			},
		}
	end,
}
