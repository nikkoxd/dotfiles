return {
  {
    "echasnovski/mini.ai",
    version = "*",
  },
  {
    "echasnovski/mini.align",
    version = "*",
    lazy = false,
    opts = {}
  },
  {
    "echasnovski/mini.files",
    version = "*",
    keys = {
      { "<leader>pv", function() if not MiniFiles.close() then MiniFiles.open() end end, desc = "Toggle mini.files" },
      { "<leader>pV", function() if not MiniFiles.close() then MiniFiles.open(vim.api.nvim_buf_get_name(0)) end end, desc = "Toggle mini.files" },
    },
    opts = {
    }
  }
}
