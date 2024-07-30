return {
  "nvim-neorg/neorg",
  dependencies = {
    "3rd/image.nvim",
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
      ["core.summary"] = {},
    }
  }
}
