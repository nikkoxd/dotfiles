return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "b0o/schemastore.nvim",
    "SmiteshP/nvim-navic",
  },

  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        opts.desc = "LSP Info"
        vim.keymap.set("n", "<leader>cl", "<cmd>LspInfo<cr>", opts)
        opts.desc = "Show Definitions"
        vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, opts)
        opts.desc = "Show References"
        vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
        opts.desc = "Show Implementations"
        vim.keymap.set("n", "gI", require("telescope.builtin").lsp_implementations, opts)
        opts.desc = "Show Type Definitions"
        vim.keymap.set("n", "gy", require("telescope.builtin").lsp_type_definitions, opts)
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
        vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, opts)
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

    local navic = require("nvim-navic")
    local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
    local event = "BufWritePre" -- or "BufWritePost"
    local async = event == "BufWritePost"
    local on_attach = function(client, bufnr)
      if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
      end

      if client.supports_method("textDocument/formatting") then
      vim.keymap.set("n", "<Leader>f", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })

      -- format on save
      vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
      vim.api.nvim_create_autocmd(event, {
        buffer = bufnr,
        group = group,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr, async = async })
        end,
        desc = "[lsp] format on save",
      })
    end

    if client.supports_method("textDocument/rangeFormatting") then
      vim.keymap.set("x", "<Leader>f", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })
    end
    end

    local lspconfig = require("lspconfig")

    lspconfig.nushell.setup{}

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
      },

      automatic_installation = true,

      handlers = {
        function(server_name)
          lspconfig[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach
          }
        end,

        lua_ls = function()
          lspconfig.lua_ls.setup {
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" }
                }
              }
            },
            on_attach = on_attach
          }
        end,

        jsonls = function()
          lspconfig.jsonls.setup {
            settings = {
              json = {
                schemas = require("schemastore").json.schemas(),
                validate = { enable = true },
              }
            },
            on_attach = on_attach
          }
        end,

        bashls = function()
          lspconfig.bashls.setup {
            filetypes = { "sh", "zsh" }
          }
        end
      }
    })
  end
}
