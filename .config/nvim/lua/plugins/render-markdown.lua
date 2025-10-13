return {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
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
