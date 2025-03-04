return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = {
      checkbox = {
        checked = {
          scope_highlight = "@markup.strikethrough",
        },
      },
      code = {
        width = "block",
      },
      indent = {
        enabled = true,
        icon = "",
      },
    },
}
