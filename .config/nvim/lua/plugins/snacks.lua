---@diagnostic disable: undefined-global
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    --  NOTE: Zen keymaps
    { "<leader>z",  function() Snacks.zen() end,                                            desc = "Toggle zen" },
    { "<leader>Z",  function() Snacks.zen.zoom() end,                                       desc = "Toggle zen zoom" },

    --  NOTE: Notifier keymaps
    { "<leader>nd", function() Snacks.notifier.hide() end,                                  desc = "Hide notifications" },
    { "<leader>nn", function() Snacks.picker.notifications() end,                           desc = "Notifications history" },

    --  NOTE: Picker keymaps
    { "<leader>pf", function() Snacks.picker.files() end,                                   desc = "Find files" },
    { "<leader>ph", function() Snacks.picker.smart() end,                                   desc = "Smart find files" },
    { "<leader>ps", function() Snacks.picker.grep() end,                                    desc = "Grep string" },
    { "<leader>pr", function() Snacks.picker.recent() end,                                  desc = "Recent files" },

    { "<leader>pg", function() Snacks.picker.git_files() end,                               desc = "Git files" },
    { "<leader>gp", function() Snacks.picker.projects() end,                                desc = "Projects" },
    { "<leader>gl", function() Snacks.picker.git_log() end,                                 desc = "Git log" },

    { "<leader>pb", function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
    { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace Symbols" },

    { "<leader>vh", function() Snacks.picker.help() end,                                    desc = "Help tags" },
    { "<leader>vc", function() Snacks.picker.files({ cwd = vim.fn.stdpath('config') }) end, desc = "Config" },

    { "<leader>hl", function() Snacks.picker.highlights() end,                              desc = "Highlight groups" },
    { "<leader>th", function() Snacks.picker.colorschemes() end,                            desc = "Themes" },
  },
  opts = {
    --  NOTE: Work with big files
    bigfile = {},
    --  NOTE: Alpha-like dashboard
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
    --  NOTE: Fancy input buffer
    input = {},
    --  NOTE: Nvim-notify replacement
    notifier = {
      style = "minimal",
    },
    --  NOTE: Telescope replacement
    picker = {
      ui_select = true,
    },
    --  NOTE: Smooth scrolling
    scroll = {
      animate = {
        duration = { step = 5, total = 100 },
      }
    },
    --  NOTE: Zen mode
    zen = {
      toggles = {
        dim = false,
      },
      show = {
        statusline = true,
      },
    },
  },
}
