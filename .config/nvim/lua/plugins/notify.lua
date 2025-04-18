return {
  "rcarriga/nvim-notify",
  keys = {
    { "<leader>nd", function() require("notify").dismiss({ silent = true, pending = true }) end, desc = "Dismiss notifications" },
  },
  opts = {
    render = "wrapped-compact",
  },
  init = function()
    vim.notify = require("notify")
  end,
}
