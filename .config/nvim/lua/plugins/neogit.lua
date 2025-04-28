return {
  "NeogitOrg/neogit",
  --  NOTE: Disabled until neogit implements Snacks.picker support
  --        Until then use fugitive
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
  },
  keys = {
    { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
  },
  opts = {}
}

