return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    { "<leader>z", function() Snacks.zen() end, desc = "Toggle zen" },
    { "<leader>pf", function() Snacks.picker.files() end, desc = "Find files" },
    { "<leader>ph", function() Snacks.picker.smart() end, desc = "Smart find files" },
    { "<leader>pg", function() Snacks.picker.git_files() end, desc = "Git files" },
    { "<leader>ps", function() Snacks.picker.grep() end, desc = "Grep string" },
    { "<leader>vh", function() Snacks.picker.help() end, desc = "Help tags" },
    { "<leader>vc", function() Snacks.picker.files({ cwd = vim.fn.stdpath('config') }) end, desc = "Config" },
    { "<leader>pr", function() Snacks.picker.recent() end, desc = "Recent files" },
    { "<leader>pb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>th", function() Snacks.picker.colorschemes() end, desc = "Themes" },
    { "<leader>hl", function() Snacks.picker.highlights() end, desc = "Highlight groups" },
  },
  opts = {
    bigfile = {},
    dashboard = {
      preset = {
        keys = {
          { icon = " ", key = "f", desc = "find file", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "new file", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "find text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "recent files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "restore session", section = "session" },
          { icon = "󰒲 ", key = "l", desc = "lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "quit", action = ":qa" },
        },
        header = [[neovim]]
      },
      sections = {
        { section = "header" },
        { icon = "󰌌 ", title = "keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = " ", title = "recent files", section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "projects", section = "projects", indent = 2, padding = 1 },
        { section = "startup" },
      }
    },
    image = {
      doc = {
        max_width = 40,
      },
      convert = {
        notify = false,
      },
    },
    zen = {
      dim = false,
    },
  },
}
