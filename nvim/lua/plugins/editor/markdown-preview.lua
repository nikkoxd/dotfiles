return {
  "iamcco/markdown-preview.nvim",
  keys = {
    { "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", desc = "Toggle Markdown preview" },
  },
  ft = { "markdown" },
  build = "cd app && npm install",
  config = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
}
