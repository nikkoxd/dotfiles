return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
    "epwalsh/pomo.nvim"
  },
  keys = {
    { "<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "Open in Obsidian" },
    { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New note" },
    { "<leader>os", "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick switch to another note" },
    { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Show backlinks" },
    { "<leader>or", "<cmd>ObsidianRename<cr>", desc = "Rename note" },
    { "<leader>ot", "<cmd>ObsidianTags<cr>", desc = "Show tags" },
    { "<leader>op", "<cmd>ObsidianPasteImg<cr>", desc = "Paste image from clipboard" },
    { "<leader>oe", "<cmd>ObsidianExtractNote<cr>", mode = "v", desc = "Extract note" },
  },
  opts = {
    ui = {
      enable = false,
    },
    workspaces = {
      {
        name = "vault",
        path = "/Users/nikko/Library/Mobile Documents/iCloud~md~obsidian/Documents/Obsidian Vault/"
      }
    }
  }
}
