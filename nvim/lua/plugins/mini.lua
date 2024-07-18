return {
  {
    "echasnovski/mini.files",
    version = "*",
    keys = {
      { "<leader>pv", function() MiniFiles.open() end, desc = "Path view" }
    },
    opts = {
      options = {
        permament_delete = false,
      }
    },
  }
}
