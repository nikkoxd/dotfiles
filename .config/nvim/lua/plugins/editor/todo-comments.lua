return {
  "folke/todo-comments.nvim",
  cmd = { "TodoTrouble", "TodoTelescope" },
  event = "VeryLazy",
  opts = {},
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo comment" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo comment" },
    { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "Todo (Trouble)" },
    { "<leader>pt", "<cmd>TodoTelescope<cr>", desc = "Todo (Telescope)" },
  }
}
