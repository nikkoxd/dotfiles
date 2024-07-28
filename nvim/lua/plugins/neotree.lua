return {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = false,
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",
  },
  keys = {
    { "<leader>pv", "<cmd>Neotree filesystem reveal<cr>", desc = "Open Neotree" },
  },
  opts = {
    close_if_last_window = false,
    enable_git_status = true,
    enable_diagnostics = true,
    sort_case_insensitive = true,
  },
}
