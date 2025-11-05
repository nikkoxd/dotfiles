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
				theme = "custom_neopywal",
				component_separators = "",
				section_separators = "",
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					"mode",
				},
				lualine_b = {
					{
						"filename",
						symbols = {
							modified = "(modified)",
							readonly = "(readonly)",
							unnamed = "unnamed",
							newfile = "new",
						},
					},
				},
				lualine_c = {
					"diagnostics",
				},
				lualine_x = {
					"overseer",
                    "filetype",
					{
						"branch",
                        icon = ""
					},
				},
				lualine_y = {
                    "progress",
				},
				lualine_z = {
					"location",
				},
			},
		}
	end,
}
