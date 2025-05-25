return {
  'stevearc/overseer.nvim',
  keys = {
    { "<leader>tt", "<cmd>OverseerToggle<cr>", desc = "Overseer" },
    { "<leader>tr", "<cmd>OverseerRun<cr>", desc = "Overseer Run" },
  },
  opts = {
    templates = { "builtin", "cmake" },
    task_list = {
      direction = "left"
    },
  },
}
