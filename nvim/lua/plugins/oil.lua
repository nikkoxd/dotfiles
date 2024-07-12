return {
  "stevearc/oil.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "-", "<cmd>Oil<CR>", desc = "Open parent directory" },
  },
  opts = {
    delete_to_trash = true,
  }
}
