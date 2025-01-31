local vars = require("config.vars")

return {
  "RedsXDD/neopywal.nvim",
  name = "neopywal",
  lazy = false,
  priority = 1000,
  keys = {
    { "<leader>nc", "<cmd>NeopywalCompile<cr>", desc = "Recompile neopywal" },
  },
  opts = {
    transparent_background = vars.transparency,
    show_split_lines = false,
    dim_inactive = true,
    plugins = {
      gitsigns = true,
      harpoon = true,
      which_key = true,
      neogit = true,
      telescope = {
        enabled = true,
        style = "nvchad",
      },
      trouble = true,
    }
  }
}
