return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Image support (doesn't work with Alacritty)
  },
  keys = {
    { "<leader>pv", "<cmd>Neotree toggle<CR>", "Toggle Neotree" }
  },
  opts = {
    popup_border_style = "rounded",
    window = {
      position = "float"
    }
  }
}
