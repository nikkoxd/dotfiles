return {
	"saghen/blink.cmp",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"folke/lazydev.nvim",
		"moyiz/blink-emoji.nvim",
	},
	version = "1.*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "enter" },

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = { documentation = { auto_show = true } },

		snippets = { preset = "luasnip" },

		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "emoji" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
				emoji = {
					module = "blink-emoji",
					name = "Emoji",
					score_offset = 15, -- Tune by preference
					opts = {
						insert = true, -- Insert emoji (default) or complete its name
						---@type string|table|fun():table
						trigger = function()
							return { ":" }
						end,
					},
				},
			},
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },

		signature = { enabled = true },
	},
	opts_extend = { "sources.default" },
}
