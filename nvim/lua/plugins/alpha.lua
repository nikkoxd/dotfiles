return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    local function footer()
      local total_plugins = require("lazy").stats().count
      local version = vim.version()
      local nvim_version_info = "     " .. version.major .. "." .. version.minor .. "." .. version.patch

      return "󰚥  " .. total_plugins .. " plugins " .. nvim_version_info
    end

    dashboard.section.header.val = {
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⡄⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡟⠻⣷⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⡀⠀⠀⢸⡿⣿⠇⠰⠟⠀⠀",
      "⠀⠀⠀⠀⣀⡤⣤⠶⠛⠉⠉⠀⠀⠉⠉⠛⠲⣤⣤⣄⠀⠀⠀⠀⠀",
      "⠀⠀⠀⡼⠃⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠈⢧⠀⠀⠀⠀",
      "⠀⠀⡼⢁⡆⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡄⠀⢰⡈⢧⠀⠀⠀",
      "⢀⡞⠁⣸⠁⠀⢠⠬⠓⠀⣀⠀⠀⢀⠀⠛⠥⣄⠀⠀⡇⠈⢳⡀⠀",
      "⡞⠀⠀⠹⣆⠀⠀⠆⠀⠀⠓⠊⠙⠚⠁⠀⠀⠀⠀⣰⠇⠀⠀⢻⠀",
      "⣇⠀⠀⠀⠈⣹⠶⠦⠤⠤⣤⣤⣤⡤⠤⠤⠴⠶⣏⠁⠀⠀⠀⣸⠁",
      "⠈⠓⠲⠖⠚⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠓⠲⠶⠚⠁⠀",
    }

    dashboard.section.buttons.val = {
      dashboard.button("e", "󰈔  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("SPC p f", "󰈞  Find file", ":Telescope find_files<CR>"),
      dashboard.button("SPC p r", "󱋡  Recent", ":Telescope oldfiles<CR>"),
      dashboard.button("SPC p v", "󰉋  Directory", ":NvimTreeToggle<CR>"),
      dashboard.button("l", "󰒲  View plugins", ":Lazy<CR>"),
      dashboard.button("u", "󰑐  Update plugins", ":Lazy update<CR>"),
      dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
    }

    dashboard.section.footer.val = footer()

    dashboard.config.opts.noautocmd = true

    alpha.setup(dashboard.config)
  end,
}
