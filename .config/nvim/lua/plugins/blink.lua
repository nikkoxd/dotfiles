return {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
    'folke/lazydev.nvim'
  },
  version = '1.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = 'enter' },

    appearance = {
      nerd_font_variant = 'mono'
    },

    completion = { documentation = { auto_show = true } },

    sources = {
      default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        }
      }
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },

    signature = { enabled = true },
  },
  opts_extend = { "sources.default" }
}
