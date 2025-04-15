return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "b0o/schemastore.nvim",
  },

  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        opts.desc = "LSP Info"
        vim.keymap.set("n", "<leader>cl", "<cmd>LspInfo<cr>", opts)
        opts.desc = "Show Definitions"
        vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, opts)
        opts.desc = "Show References"
        vim.keymap.set("n", "gr", function() Snacks.picker.lsp_references() end, opts)
        opts.desc = "Show Implementations"
        vim.keymap.set("n", "gI", function() Snacks.picker.lsp_implementations() end, opts)
        opts.desc = "Show Type Definitions"
        vim.keymap.set("n", "gy", function() Snacks.picker.lsp_type_definitions() end, opts)
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

    local lspconfig = require("lspconfig")

    lspconfig.qmlls.setup {}

    ---@type MasonSettings
    require("mason").setup()

    ---@type MasonLspconfigSettings
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
      },

      automatic_installation = true,

      handlers = {
        function(server_name)
          lspconfig[server_name].setup {
            capabilities = capabilities,
          }
        end,

        ts_ls = function()
          lspconfig.ts_ls.setup {
            init_options = {
              plugins = {
                {
                  name = "@vue/typescript-plugin",
                  location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
                  languages = {"javascript", "typescript", "vue"},
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
          }
        end,

        -- lua_ls = function()
        --   lspconfig.lua_ls.setup {
        --     settings = {
        --       Lua = {
        --         workspace = {
        --           checkThirdParty = false,
        --           telemetry = { enable = false },
        --           library = {
        --             [ vim.fn.expand "${3rd}/live2d/library" ] = true,
        --           },
        --         },
        --         diagnostics = {
        --           globals = { "vim" }
        --         },
        --       }
        --     },
        --   }
        -- end,

        jsonls = function()
          lspconfig.jsonls.setup {
            capabilities = capabilities,
            settings = {
              json = {
                schemas = require("schemastore").json.schemas(),
                validate = { enable = true },
              }
            },
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
