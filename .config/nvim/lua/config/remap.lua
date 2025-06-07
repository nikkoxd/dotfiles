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

-- Move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- window navigation prefix
vim.keymap.set("n", "<leader>w", "<C-w>", { noremap = true })

-- yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- conceal levels
vim.keymap.set("n", "<leader>c1", ":set conceallevel=1<CR>", { noremap = true })
vim.keymap.set("n", "<leader>c2", ":set conceallevel=2<CR>", { noremap = true })
vim.keymap.set("n", "<leader>c3", ":set conceallevel=3<CR>", { noremap = true })
