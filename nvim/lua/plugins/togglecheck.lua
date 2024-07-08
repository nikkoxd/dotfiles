return {
  "nfrid/markdown-togglecheck",
  dependencies = { "nfrid/treesitter-utils" },
  ft = { "markdown" },
  keys = {
    { "<leader>t", function() require("markdown-togglecheck").toggle() end, { desc = "Toggle checkbox" } },
  }
}
