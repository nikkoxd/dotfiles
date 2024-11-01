return {
  "mrjones2014/smart-splits.nvim",
  config = function()
    require("smart-splits").setup({
      at_edge = function(context)
        local dmap = {
          left = "west",
          down = "south",
          up = "north",
          right = "east",
        }
        if context.mux.current_pane_at_edge(context.direction) then
          local ydirection = dmap[context.direction]
          local command = "yabai -m window --focus " .. ydirection

          if ydirection == "west" or ydirection == "east" then
            command = command .. " || yabai -m display --focus " .. ydirection
          end

          vim.fn.system(command)
        end
      end,
    })
    vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
    vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
    vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
    vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
    -- resizing
    vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
    vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
    vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
    vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
    -- swapping
    vim.keymap.set('n', '<A-H>', require('smart-splits').swap_buf_left)
    vim.keymap.set('n', '<A-J>', require('smart-splits').swap_buf_down)
    vim.keymap.set('n', '<A-K>', require('smart-splits').swap_buf_up)
    vim.keymap.set('n', '<A-L>', require('smart-splits').swap_buf_right)
  end
}
