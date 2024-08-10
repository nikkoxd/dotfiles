return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "b0o/nvim-tree-preview.lua",
  },
  keys = {
    { "<leader>pv", "<cmd>NvimTreeToggle<cr>", desc = "Toggle nvim-tree (root)" },
    { "<leader>pV", "<cmd>NvimTreeFindFile<cr>", desc = "Toggle nvim-tree (cwd)" }
  },
  opts = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- nvim-tree is also there in modified buffers so this function filter it out
    local modifiedBufs = function(bufs)
      local t = 0
      for k,v in pairs(bufs) do
        if v.name:match("NvimTree_") == nil then
          t = t + 1
        end
      end
      return t
    end

    vim.api.nvim_create_autocmd("BufEnter", {
      nested = true,
      callback = function()
        if #vim.api.nvim_list_wins() == 1 and
          vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil and
          modifiedBufs(vim.fn.getbufinfo({bufmodified = 1})) == 0 then
          vim.cmd "quit"
        end
      end
    })

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
