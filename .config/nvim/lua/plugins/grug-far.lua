return {
  'MagicDuck/grug-far.nvim',
  lazy = false,
  keys = {
    { "<leader>gf", function() require("grug-far").open() end, desc = "Grug far" },
  },
  opts = {},
}
