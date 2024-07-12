local nikko_autocmds = vim.api.nvim_create_augroup("nikko_autocmds", { clear = true })

-- Hot reload kitty config
vim.api.nvim_create_autocmd("BufWritePost", {
  group = nikko_autocmds,
  pattern = "kitty.conf",
  command = "silent !kill -SIGUSR1 $(pgrep -a kitty)"
})

-- Sync notes
vim.api.nvim_create_autocmd("BufWritePost", {
  group = nikko_autocmds,
  pattern = "*.norg",
  callback = function()
    vim.cmd("silent !git add * && (git diff-index --quiet HEAD || git commit -am \"" .. os.date("%c") .. "\") && git pull && git push")
    vim.notify("Synced notes with git")
  end,
})

vim.g.has_pulled_notes = false
vim.api.nvim_create_autocmd('BufRead', {
  group = nikko_autocmds,
  pattern = "*.norg",
  callback = function()
    if not vim.g.has_pulled_notes then
      -- vim.cmd("silent !bash -c 'cd ~/neorg && git pull && echo \"Notes pulled from git\" && cd -'")
      vim.cmd("silent !git pull")
      vim.notify("Pulled notes from git")
      vim.g.has_pulled_notes = true
    end
  end
})
