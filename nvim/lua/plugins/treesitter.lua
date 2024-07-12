return {
  "nvim-treesitter/nvim-treesitter",

  build = ":TSUpdate",

  keys = {
    { "<leader>tr", function() require("telescope.builtin").treesitter() end, desc = "Treesitter" },
  },

  config = function()
    require("nvim-treesitter.install").compilers = { "gcc-14" }
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
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
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
