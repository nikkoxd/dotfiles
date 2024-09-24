return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer Local Keymaps (which-key)" },
  },
  config = function()
    local colors = require("neopywal").get_colors()

    vim.api.nvim_set_hl(0, "WhichKeyNormal", { fg = colors.foreground, bg = colors.background })
    vim.api.nvim_set_hl(0, "WhichKeySeparator", { fg = colors.foreground, bg = colors.background })
  end,
}
