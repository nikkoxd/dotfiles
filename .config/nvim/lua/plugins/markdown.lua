return {
	-- FORMATTING KEYMAPS
	{
		"antonk52/markdowny.nvim",
		lazy = false,
		opts = {},
	},
	-- BROWSER PREVIEW
	{
		"brianhuster/live-preview.nvim",
		dependencies = {
			-- You can choose one of the following pickers
			"folke/snacks.nvim",
		},
	},
	{
		"toppair/peek.nvim",
		enbaled = false,
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		config = function()
			require("peek").setup()
			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		enabled = false,
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	-- INLINE LATEX
	{
		"Thiago4532/mdmath.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			dynamic_scale = 0.5,
		},
	},
	-- OBSIDIAN INTEGRATION
	{
		"obsidian-nvim/obsidian.nvim",
		enabled = false,
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
			"nvim-treesitter/nvim-treesitter",
			"epwalsh/pomo.nvim",
		},
		keys = {
			{ "<leader>oo", "<cmd>Obsidian open<cr>", desc = "Open in Obsidian" },
			{ "<leader>on", "<cmd>Obsidian new<cr>", desc = "New note" },
			{ "<leader>os", "<cmd>Obsidian quick_switch<cr>", desc = "Quick switch to another note" },
			{ "<leader>ob", "<cmd>Obsidian backlinks<cr>", desc = "Show backlinks" },
			{ "<leader>or", "<cmd>Obsidian rename<cr>", desc = "Rename note" },
			{ "<leader>ot", "<cmd>Obsidian tags<cr>", desc = "Show tags" },
			{ "<leader>oe", "<cmd>Obsidian extract_note<cr>", mode = "v", desc = "Extract note" },
			{ "<leader>ip", "<cmd>Obsidian paste_img<cr>", desc = "Paste image from clipboard" },
		},
		opts = {
			legacy_commands = false,
			attachments = {
				img_folder = "./",
			},
			ui = {
				enable = true,
			},
			workspaces = {
				{
					name = "vault",
					path = "/Users/nikko/Library/Mobile Documents/iCloud~md~obsidian/Documents/Obsidian Vault/",
				},
			},
			---@param title string|?
			---@return string
			note_id_func = function(title)
				-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
				-- In this case a note with the title 'My new note' will be given an ID that looks
				-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
				local suffix = ""
				if title ~= nil then
					-- If title is given, transform it into valid file name.
					suffix = title:gsub(" ", "-"):gsub("[^[\xd0-\xd1][\xb0-\x8f]A-Za-z0-9-]", ""):lower()
				else
					-- If title is nil, just add 4 random uppercase letters to the suffix.
					for _ = 1, 4 do
						suffix = suffix .. string.char(math.random(65, 90))
					end
				end
				return tostring(os.time()) .. "-" .. suffix
			end,
			picker = {
				name = "snacks.pick",
			},
		},
	},
	-- ALTERNATIVE RENDERER
	{
		"MeanderingProgrammer/render-markdown.nvim",
		enabled = false,
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
		opts = {
			render_modes = true,
			checkbox = {
				checked = {
					scope_highlight = "@markup.strikethrough",
				},
			},
			code = {
				width = "block",
			},
			-- indent = {
			--   enabled = true,
			--   icon = ""
			-- },
			latex = {
				enabled = true,
			},
		},
	},
}
