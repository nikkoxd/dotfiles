return {
  "nvim-neorg/neorg",
  opts = {
    load = {
      ["core.defaults"] = {},
      ["core.dirman"] = {
        config = {
          workspaces = {
            notes = "~/Documents/neorg",
            uni = "~/Documents/Уник/neorg",
          },
        },
      },
      ["core.completion"] = {
        config = {
          engine = "nvim-cmp",
        },
      },
      ["core.integrations.nvim-cmp"] = {},
      ["core.concealer"] = {
        config = {
          icon_preset = "diamond",
        },
      },
      ["core.summary"] = {},
      ["core.text-objects"] = {},
      ["core.export"] = {},
    }
  }
}
