return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    { "<leader>z", function() Snacks.zen() end, desc = "Toggle zen" },
  },
  opts = {
    animate = {},
    bigfile = {},
    image = {
      doc = {
        max_width = 40,
      },
    },
    scope = {},
    words = {},
    zen = {
      dim = false,
    },
  },
}
