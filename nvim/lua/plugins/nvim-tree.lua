return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>pv", "<cmd>NvimTreeToggle<CR>", desc = "Open nvim-tree" },
  },
  opts = {
    disable_netrw = true,
    update_focused_file = {
      enable = true,
    },
    diagnostics = {
      enable = true,
    },
    modified = {
      enable = true,
    }
  }
}
