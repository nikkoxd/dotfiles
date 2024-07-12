return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-tree/nvim-web-devicons",
  },

  keys = {
    { "<leader>pf", function() require("telescope.builtin").find_files() end, desc = "Find files" },
    { "<leader>pv", function() require("telescope").extensions.file_browser.file_browser() end, desc = "File browser" },
    { "<C-p>", function() require("telescope.builtin").git_files() end, desc = "Git files" },
    { "<leader>ps", function() require("telescope.builtin").live_grep() end, desc = "Grep string" },
    { "<leader>vh", function() require("telescope.builtin").help_tags() end, desc = "Help tags" },
  },

  config = function()
    require("telescope").setup({
      defaults = {
        path_display = { "smart" },
      },
      extensions = {
        file_browser = {
          grouped = true,
        }
      }
    })

    require("telescope").load_extension("file_browser")
  end,
}
