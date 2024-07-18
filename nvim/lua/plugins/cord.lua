return {
  "vyfor/cord.nvim",
  build = "./build",
  event = "VeryLazy",
  opts = {
    lsp = {
      show_problem_count = true,
    },
    buttons = {}, -- Disable the View Repository button
  },
}
