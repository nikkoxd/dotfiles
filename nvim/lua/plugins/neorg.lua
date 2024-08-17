return {
  "nvim-neorg/neorg",
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
      ["core.summary"] = {},
    }
  }
}
