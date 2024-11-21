return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  lazy = false,

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },

  keys = {
    { "<leader>pf", function() require("telescope.builtin").find_files() end,                                    desc = "Find files" },
    { "<leader>ph", function() require("telescope.builtin").find_files({ hidden = true, no_ignore = true }) end, desc = "Find files (hidden, no_ignore)" },
    { "<leader>pg", function() require("telescope.builtin").git_files() end,                                     desc = "Git files" },
    { "<leader>ps", function() require("telescope.builtin").live_grep() end,                                     desc = "Grep string" },
    { "<leader>vh", function() require("telescope.builtin").help_tags() end,                                     desc = "Help tags" },
    { "<leader>pr", function() require("telescope.builtin").oldfiles() end,                                      desc = "Recent files" },
    { "<leader>pb", function() require("telescope.builtin").buffers() end,                                       desc = "Buffers" },
    { "<leader>th", "<cmd>Telescope themes<cr>",                                                                 desc = "Themes" }
  },

  opts = {
    defaults = {
      path_display = { "smart" },
      sorting_strategy = "ascending",
      layout_strategy = "flex",
      layout_config = {
        horizontal = { preview_cutoff = 80, preview_width = 0.55 },
        vertical = { mirror = true, preview_cutoff = 25 },
        prompt_position = "top",
        width = 0.87,
        height = 0.80,
      },
    },
  }
}
