local vars = require("config.vars")

return {
	"RedsXDD/neopywal.nvim",
	name = "neopywal",
	lazy = false,
	priority = 1000,
	keys = {
		{ "<leader>nc", "<cmd>NeopywalCompile<cr>", desc = "Recompile neopywal" },
	},
	opts = {
		transparent_background = vars.transparency,
		show_split_lines = false,
		dim_inactive = false,
		show_end_of_buffer = true,
		custom_highlights = function(C)
			return {
				all = {
					StatusLine = { bg = C.none },

					lualine_lsp = { bg = C.none, fg = C.color8 },
					lualine_icon_branch = { bg = C.none, fg = C.color3 },

					NormalFloat = { bg = C.background },
					FloatBorder = { bg = C.background, fg = C.foreground },
					FloatTitle = { bg = C.background, fg = C.color4 },

					MiniFilesTitle = { bg = C.background, fg = C.color8 },
					MiniFilesBorderModified = { bg = C.background, fg = C.color3 },

					WhichKey = { bg = C.background },

					EndOfBuffer = { fg = C.background },
					ColorColumn = { bg = C.background },

					Pmenu = { bg = C.background },
					PmenuSel = { bg = C.color4, fg = C.color0 },

					CmpItemAbbrDeprecated = { fg = C.color7, strikethrough = true },
					CmpItemMenu = { fg = C.color7, italic = true },
				},
			}
		end,
		default_plugins = false,
		plugins = {
			gitsigns = true,
			harpoon = true,
			trouble = true,
		},
	},
}
