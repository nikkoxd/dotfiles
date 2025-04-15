return {
  "goolord/alpha-nvim",
  enabled = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    local function footer()
      local version = vim.version()
      return "ver " .. version.major .. "." .. version.minor .. "." .. version.patch
    end

    dashboard.section.header.val = "neovim"

    dashboard.section.buttons.val = {
      dashboard.button("e", "new file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("spc p f", "find file"),
      dashboard.button("spc p r", "recent"),
      dashboard.button("spc p v", "tree view"),
      dashboard.button("spc q s", "restore session"),
      dashboard.button("l", "view plugins", ":Lazy<CR>"),
      dashboard.button("q", "quit neovim", ":qa<CR>"),
    }

    dashboard.section.footer.val = footer()

    dashboard.config.opts.noautocmd = true

    alpha.setup(dashboard.config)
  end,
}
