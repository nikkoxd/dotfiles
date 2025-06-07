return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  keys = {
    { "-", "<CMD>Oil<CR>", desc = "Open perent directory" },
  },
  ---@type oil.SetupOpts
  opts = {
    view_options = {
      show_hidden = true,
    },
    win_options = {
      signcolumn = "yes:2",
    },
    skip_confirm_for_simple_edits = true,
    watch_for_changes = true,
  },
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
