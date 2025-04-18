return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
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
    },
    ---@param title string|?
    ---@return string
    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will be given an ID that looks
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      local suffix = ""
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. "-" .. suffix
    end,
    picker = {
      name = "snacks.pick"
    }
  }
}
