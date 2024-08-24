local g = vim.g
local keymap = vim.keymap

g.mapleader = " "
g.maplocalleader = ","

keymap.set("n", "<leader>yf", "<cmd>%y+<CR>")

keymap.set("n", "<leader>w", "<C-w>", { noremap = true })
