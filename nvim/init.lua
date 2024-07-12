require("remap")
require("autocmds")
require("opts")

local lazypath = vim.fn.stdpath("data") .. "lazy/lazy.nvim"

-- load lazy.nvim
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- start godot server if project.godot exists
local gdproject = io.open(vim.fn.getcwd().."/project.godot", "r")
if gdproject then
    io.close(gdproject)
    vim.fn.serverstart "/tmp/godot.pipe"
end

require("lazy").setup("plugins")
