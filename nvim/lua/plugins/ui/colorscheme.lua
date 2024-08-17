return {
  "uZer/pywal16.nvim",
  name = "pywal16",
  lazy = false,
  keys = {
    { "<leader>r", "<cmd>Lazy reload pywal16<CR>", "Reload pywal16" },
  },
  config = function()
    vim.cmd("colorscheme pywal16")
  end,
}
