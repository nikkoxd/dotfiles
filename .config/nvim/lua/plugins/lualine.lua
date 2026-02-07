return {
	"nvim-lualine/lualine.nvim",
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
				lualine_a = {},
				lualine_b = {
					{
						"filename",
						symbols = {
							modified = "􁚛",
							readonly = "􀎠",
							unnamed = "Unnamed",
							newfile = "New File",
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
					-- "filetype",
					-- "lsp_status",
					-- {
					-- 	"branch",
					-- 	icons_enabled = false,
					-- },
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
