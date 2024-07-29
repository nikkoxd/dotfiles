return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "b0o/nvim-tree-preview.lua",
  },
  keys = {
    { "<leader>pv", "<cmd>NvimTreeToggle<cr>", desc = "Toggle nvim-tree" },
  },
  opts = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    return {
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")

        api.config.mappings.default_on_attach(bufnr)

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        local preview = require("nvim-tree-preview")

        vim.keymap.set("n", "P", preview.watch, opts("Preview (Watch)"))
        vim.keymap.set("n", "<Esc>", preview.unwatch, opts("Close Preview/Unwatch"))

        vim.keymap.set("n", "<Tab>", function()
          local ok, node = pcall(api.tree.get_node_under_cursor)
          if ok and node then
            if node.type == "directory" then
              api.node.open.edit()
            else
              preview.node(node, { toggle_focus = true })
            end
          end
        end, opts("Preview"))
      end,
      view = {
        relativenumber = true,
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          git_placement = "signcolumn",
        }
      },
      diagnostics = {
        enable = true,
      },
      modified = {
        enable = true,
      },
      filters = {
        dotfiles = true,
      },
    }
  end,
}
