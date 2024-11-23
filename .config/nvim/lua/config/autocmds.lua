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
    local cmd = "git add * && (git diff-index --quiet HEAD || git commit -am \"" ..
        os.date("%c") .. "\") && git pull && git push"

    local function on_exit(_, exit_code, _)
      if exit_code ~= 0 then
        vim.notify("Failed to sync notes with git")
      end
    end

    vim.fn.jobstart(cmd, {
      on_exit = on_exit,
      stdout_buffered = true,
      stderr_buffered = true,
    })
  end,
})

vim.g.has_pulled_notes = false
vim.api.nvim_create_autocmd('BufRead', {
  group = nikko_autocmds,
  pattern = "*.norg",
  callback = function()
    if not vim.g.has_pulled_notes then
      local cmd = "git pull"

      local function on_exit(_, exit_code, _)
        if exit_code ~= 0 then
          vim.notify("Failed to pull notes with git")
        else
          vim.g.has_pulled_notes = true
        end
      end

      vim.fn.jobstart(cmd, {
        on_exit = on_exit,
        stdout_buffered = true,
        stderr_buffered = true,
      })
    end
  end
})
