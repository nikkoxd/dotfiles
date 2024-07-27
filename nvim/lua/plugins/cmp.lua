return {
  "hrsh7th/nvim-cmp",

  event = "InsertEnter",

  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-emoji",
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "onsails/lspkind.nvim",
  },

  opts = function()
    return {
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = require("cmp").mapping.preset.insert({
        ["<C-p>"] = require("cmp").mapping.select_prev_item(), -- previous suggestion
        ["<C-n>"] = require("cmp").mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = require("cmp").mapping.scroll_docs(-4),
        ["<C-f>"] = require("cmp").mapping.scroll_docs(4),
        ["<C-Space>"] = require("cmp").mapping.complete(), -- show completion suggestions
        ["<C-e>"] = require("cmp").mapping.abort(),        -- close completion window
        ["<CR>"] = require("cmp").mapping.confirm({ select = false }),
      }),
      sources = require("cmp").config.sources({
        { name = "supermaven" },
        { name = "nvim_lsp" },
        { name = "lazydev",   group_index = 0 },
        { name = "luasnip" }, -- snippets
        { name = "buffer" },  -- text within current buffer
        { name = "path" },    -- file system paths
        { name = "emoji" },
        { name = "neorg" },
      }),
      --- @diagnostic disable-next-line: missing-fields
      formatting = {
        format = require("lspkind").cmp_format({
          mode = "symbol",
          max_width = 50,
          symbol_map = {
            Supermaven = ""
          }
        })
      },
      window = {
        completion = require("cmp").config.window.bordered(),
        documentation = require("cmp").config.window.bordered(),
      }
    }
  end,
}
