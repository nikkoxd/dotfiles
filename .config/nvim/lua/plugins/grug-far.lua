return {
  'MagicDuck/grug-far.nvim',
  lazy = false,
  keys = {
    { "<leader>sr", function() require("grug-far").open() end, desc = "Search and replace" },
  },
  opts = {},
}
