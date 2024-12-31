return {
  "RedsXDD/neopywal.nvim",
  name = "neopywal",
  lazy = false,
  priority = 1000,
  keys = {
    { "<leader>nc", "<cmd>NeopywalCompile<cr>", desc = "Recompile neopywal" },
  },
  opts = {
    transparent_background = true,
    show_split_lines = false,
    dim_inactive = true,
    plugins = {
      gitsigns = true,
      harpoon = true,
      which_key = true,
      barbecue = true,
      dadbod_ui = true,
      noice = true,
      telescope = {
        enabled = true,
        style = "nvchad",
      },
      trouble = true,
    }
  }
}
