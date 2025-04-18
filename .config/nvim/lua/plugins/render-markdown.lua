return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = {
      render_modes = true,
      checkbox = {
        checked = {
          scope_highlight = "@markup.strikethrough",
        },
      },
      code = {
        width = "block",
      },
      -- indent = {
      --   enabled = true,
      --   icon = ""
      -- },
      latex = {
        enabled = true,
      }
    },
}
