return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>hh", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon menu" },
    { "<leader>a", function() require("harpoon"):list():add() end, desc = "Add to harpoon" },

    { "<leader>hn", function() require("harpoon"):list():next() end, desc = "Next harpoon file" },
    { "<leader>hp", function() require("harpoon"):list():prev() end, desc = "Previous harpoon file" },

    { "<leader>1", function() require("harpoon"):list():select(1) end, desc = "Harpoon to file 1" },
    { "<leader>2", function() require("harpoon"):list():select(2) end, desc = "Harpoon to file 2" },
    { "<leader>3", function() require("harpoon"):list():select(3) end, desc = "Harpoon to file 3" },
    { "<leader>4", function() require("harpoon"):list():select(4) end, desc = "Harpoon to file 4" },
    { "<leader>5", function() require("harpoon"):list():select(5) end, desc = "Harpoon to file 5" },
    { "<leader>6", function() require("harpoon"):list():select(6) end, desc = "Harpoon to file 6" },
  },
  opts = {}
}
