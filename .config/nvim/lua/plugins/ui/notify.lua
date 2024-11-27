return {
  "rcarriga/nvim-notify",
  enabled = false,
  keys = {
    { "<leader>nd", function() require("notify").dismiss({ silent = true, pending = true }) end, desc = "Dismiss notifications" },
  },
  opts = {
    background_colour = "#000000",
    render = "minimal",
  },
  init = function()
    vim.notify = require("notify")
  end,
}
