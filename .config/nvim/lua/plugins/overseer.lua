return {
  'stevearc/overseer.nvim',
  keys = {
    { "<leader>tl", "<cmd>OverseerToggle<cr>", desc = "Task List" },
    { "<leader>tr", "<cmd>OverseerRun<cr>", desc = "Run Task" },
  },
  opts = {
    templates = { "builtin", "cmake", "gpp" },
    task_list = {
      direction = "left"
    },
  },
}
