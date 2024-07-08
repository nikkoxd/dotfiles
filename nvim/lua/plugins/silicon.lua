return {
  "michaelrommel/nvim-silicon",
  lazy = true,
  cmd = "Silicon",
  main = "nvim-silicon",
  keys = {
    { "<leader>s", ":Silicon<cr>", mode = "v", silent = true }
  },
  opts = {
    disable_defaults = true,
    font = "GeistMono Nerd Font",
    theme = "Visual Studio Dark+",
    background = nil,
    pad_horiz = 0,
    pad_vert = 0,
    no_round_corner = true,
    no_window_controls = true,
    no_line_number = true,
    language = function()
      return vim.bo.filetype
    end,
    to_clipboard = true
  }
}
