return {
  "hrsh7th/nvim-cmp",

  enabled = false,

  event = "InsertEnter",

  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-cmdline",
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "onsails/lspkind.nvim",
    "chrisgrieser/cmp-nerdfont",
  },

  opts = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        {
          name = "cmdline",
          option = {
            ignore_cmds = { "Man", "!" },
          }
        }
      })
    })

    vim.api.nvim_set_hl(0, "CmpItemKindSupermaven", { fg = "#6CC644" })

    ---@type cmp.ConfigSchema
    return {
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(),        -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      sources = cmp.config.sources({
        { name = "lazydev", group_index = 0 },
        { name = "supermaven" },
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- snippets
        { name = "buffer" },  -- text within current buffer
        { name = "path" },    -- file system paths
        { name = "emoji" },
        { name = "nerdfont" },
        { name = "neorg" },
        { name = "vim-dadbod-completion" },
      }),
      formatting = {
        fields = { "abbr", "kind", "menu", },
        format = function(entry, item)
          item = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            symbol_map = { Supermaven = "", },
          })(entry, item)

          return item
        end,
      },
      view = {
        docs = {
          auto_open = true,
        },
      },
    }
  end,
}
