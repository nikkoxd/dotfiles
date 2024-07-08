return {
  "nvim-treesitter/nvim-treesitter",

  build = ":TSUpdate",

  keys = {
    { "<leader>tr", function() require("telescope.builtin").treesitter() end, desc = "Treesitter" },
  },

  opts = {
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
  },
}
