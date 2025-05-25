return {
  "nvim-treesitter/nvim-treesitter",

  build = ":TSUpdate",

  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "html",
        "gdscript",
        "godot_resource",
        "gdshader",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "typescript",
        "astro",
        "python",
      },
      auto_install = true,
      ignore_install = {},
      sync_install = false,
      highlight = {
        enable = true,
      },
      modules = {}
    })
  end,
}
