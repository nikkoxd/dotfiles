return {
  "nvim-neorg/neorg",
  version = "*",
  dependencies = {
    {
      "vhyrro/luarocks.nvim",
      priority=1000,
      opts = {}
    }
  },
  opts = {
    load = {
      ["core.defaults"] = {},
      ["core.concealer"] = {},
    }
  }
}
