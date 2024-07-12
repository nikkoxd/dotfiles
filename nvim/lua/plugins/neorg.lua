return {
  "nvim-neorg/neorg",
  version = "*",
  dependencies = {
    {
      "vhyrro/luarocks.nvim",
      priority=1000,
      opts = {
        rocks = { "magick" },
      }
    },
    {
      "3rd/image.nvim",
      opts = {}
    },
  },
  opts = {
    load = {
      ["core.defaults"] = {},
      ["core.completion"] = {
        config = {
          engine = "nvim-cmp",
        },
      },
      ["core.integrations.nvim-cmp"] = {},
      ["core.concealer"] = {},
      ["core.integrations.image"] = {},
    }
  }
}
