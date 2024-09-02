return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer Local Keymaps (which-key)" },
  },
  config = function()
    local pywal16_core = require("pywal16.core")
    local colors = pywal16_core.get_colors()

    vim.api.nvim_set_hl(0, "WhichKeyNormal", { fg = colors.foreground, bg = colors.transparent })
    vim.api.nvim_set_hl(0, "WhichKeySeparator", { fg = colors.foreground, bg = colors.transparent })
  end,
}
