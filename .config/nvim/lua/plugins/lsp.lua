---@diagnostic disable: undefined-global
return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		-- "hrsh7th/cmp-nvim-lsp",
		"b0o/schemastore.nvim",
		"stevearc/conform.nvim",
		"zapling/mason-conform.nvim",
	},

	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }
				opts.desc = "LSP Info"
				vim.keymap.set("n", "<leader>cl", "<cmd>LspInfo<cr>", opts)
				opts.desc = "Show Definitions"
				vim.keymap.set("n", "gd", function()
					Snacks.picker.lsp_definitions()
				end, opts)
				opts.desc = "Show References"
				vim.keymap.set("n", "gr", function()
					Snacks.picker.lsp_references()
				end, opts)
				opts.desc = "Show Implementations"
				vim.keymap.set("n", "gI", function()
					Snacks.picker.lsp_implementations()
				end, opts)
				opts.desc = "Show Type Definitions"
				vim.keymap.set("n", "gy", function()
					Snacks.picker.lsp_type_definitions()
				end, opts)
				opts.desc = "Jump to declaration"
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				opts.desc = "Display hover information"
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				opts.desc = "Display signature inforamtion"
				vim.keymap.set("n", "<leader>gk", vim.lsp.buf.signature_help, opts)
				opts.desc = "Show code actions"
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				opts.desc = "Run code lens"
				vim.keymap.set("n", "<leader>cc", vim.lsp.codelens.run, opts)
				opts.desc = "Refresh code lens"
				vim.keymap.set("n", "<leader>cC", vim.lsp.codelens.refresh, opts)
				opts.desc = "Rename"
				vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
				opts.desc = "Show diagnostics"
				vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float, opts)
				opts.desc = "Format current file"
				vim.keymap.set("n", "<leader>ff", function()
					require("conform").format()
				end, opts)
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		vim.lsp.enable("qmlls")

		vim.lsp.config("ts_ls", {
			init_options = {
				plugins = {
					{
						name = "@vue/typescript-plugin",
						location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
						languages = { "javascript", "typescript", "vue" },
					},
				},
			},
			filetypes = {
				"javascript",
				"typescript",
				"javascriptreact",
				"typescriptreact",
				"vue",
			},
		})

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = {
            path = {
              "?.lua",
              "?.so",
              "?/init.lua"
            }
          }
        },
      },
    })

		vim.lsp.enable("prolog_ls")

		---@type MasonSettings
		require("mason").setup()

		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				json = { "prettier" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				vue = { "prettier" },
				bash = { "shfmt" },
				sh = { "shfmt" },
			},
		})
		require("mason-conform").setup()

		---@type MasonLspconfigSettings
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
			},

			automatic_enable = true,
			automatic_installation = true,
		})
	end,
}
