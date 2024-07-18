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
        vim.keymap.set("n", "<leader>cl", "<cmd>LspInfo<cr>", opts)
        vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, opts)
        vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
        vim.keymap.set("n", "gI", require("telescope.builtin").lsp_implementations, opts)
        vim.keymap.set("n", "gy", require("telescope.builtin").lsp_type_definitions, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>gk", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>cc", vim.lsp.codelens.run, opts)
        vim.keymap.set("n", "<leader>cC", vim.lsp.codelens.refresh, opts)
        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float, opts)
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

    local navic = require("nvim-navic")
    local on_attach = function(client, bufnr)
      if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
      end
    end,

    ---@diagnostic disable-next-line: redundant-value
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "astro",
        "eslint",
        "tsserver",
        "tailwindcss",
        "marksman",
        "pyright",
        "jsonls",
      },

      handlers = {
        function (server_name)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach
          }
        end,

        ["lua_ls"] = function ()
          local lspconfig = require("lspconfig")
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

        ["jsonls"] = function ()
          local lspconfig = require("lspconfig")
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
      }
    })

    require("lspconfig")["gdscript"].setup({
      name = "godot",
      cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
    })

    require("lspconfig")["gdshader_lsp"].setup({})
  end
}
