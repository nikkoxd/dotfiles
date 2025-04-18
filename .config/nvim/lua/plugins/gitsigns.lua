return {
  "lewis6991/gitsigns.nvim",
  lazy = false,
  keys = {
    { "<leader>gh", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview hunk" },
    { "<leader>gt", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Toggle Git blame" },
  },
  opts = {}
}
