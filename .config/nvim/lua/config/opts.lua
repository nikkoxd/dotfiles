local opt = vim.opt

opt.conceallevel = 2
opt.autoread = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.number = true
opt.relativenumber = true

opt.cursorline = true

opt.cmdheight = 0

opt.ignorecase = true
opt.smartcase = true

opt.splitright = true

opt.scrolloff = 8

opt.foldcolumn = "0"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

opt.termguicolors = true

vim.diagnostic.config({
  virtual_text = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅙",
      [vim.diagnostic.severity.HINT] = "󰌵",
      [vim.diagnostic.severity.INFO] = "󰋼",
      [vim.diagnostic.severity.WARN] = "󰀦",
    },
  },
})
