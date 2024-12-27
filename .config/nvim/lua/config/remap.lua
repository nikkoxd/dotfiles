local keymap = vim.keymap

vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.cmd("ca W w")
vim.cmd("ca Q q")
vim.cmd("ca ц w")
vim.cmd("ca й q")
vim.cmd("ca Ц w")
vim.cmd("ca Й q")
vim.cmd("ca WQ wq")
vim.cmd("ca Wq wq")
vim.cmd("ca цй wq")

-- window navigation prefix
keymap.set("n", "<leader>w", "<C-w>", { noremap = true })

-- yank to system clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

-- conceal levels
keymap.set("n", "<leader>c1", ":set conceallevel=1<CR>", { noremap = true })
keymap.set("n", "<leader>c2", ":set conceallevel=2<CR>", { noremap = true })
keymap.set("n", "<leader>c3", ":set conceallevel=3<CR>", { noremap = true })
