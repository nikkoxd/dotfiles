vim.opt.conceallevel = 2
vim.opt.autoread = true
vim.opt.swapfile = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true

-- vim.opt.cmdheight = 0

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.splitright = true

vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

vim.opt.termguicolors = true

vim.g.filetype_pl = "prolog"

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
