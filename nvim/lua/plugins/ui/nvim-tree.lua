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

    -- autoclose tree when it's the last buffer
    vim.api.nvim_create_autocmd("QuitPre", {
      callback = function()
        local tree_wins = {}
        local floating_wins = {}
        local wins = vim.api.nvim_list_wins()
        for _, w in ipairs(wins) do
          local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
          if bufname:match("NvimTree_") ~= nil then
            table.insert(tree_wins, w)
          end
          if vim.api.nvim_win_get_config(w).relative ~= '' then
            table.insert(floating_wins, w)
          end
        end
        if 1 == #wins - #floating_wins - #tree_wins then
          -- Should quit, so we close all invalid windows.
          for _, w in ipairs(tree_wins) do
            vim.api.nvim_win_close(w, true)
          end
        end
      end
    })

    return {
      on_attach = function(bufnr)
        -- preview
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

        -- h, j, k, l style navigation and editing
        local function edit_or_open()
          local node = api.tree.get_node_under_cursor()

          if node.nodes ~= nil then
            -- expand or collapse folder
            api.node.open.edit()
          else
            -- open file
            api.node.open.edit()
            -- Close the tree if file was opened
            -- api.tree.close()
          end
        end

        -- open as vsplit on current node
        local function vsplit_preview()
          local node = api.tree.get_node_under_cursor()

          if node.nodes ~= nil then
            -- expand or collapse folder
            api.node.open.edit()
          else
            -- open file as vsplit
            api.node.open.vertical()
          end

          -- Finally refocus on tree if it was lost
          api.tree.focus()
        end

        vim.keymap.set("n", "l", edit_or_open,          opts("Edit Or Open"))
        vim.keymap.set("n", "L", vsplit_preview,        opts("Vsplit Preview"))
        vim.keymap.set("n", "h", api.tree.close,        opts("Close"))
        -- vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))
      end,
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          git_placement = "signcolumn",
          glyphs = {
            git = {
              unstaged  = "U",
              staged    = "A",
              unmerged  = "M",
              renamed   = "R",
              untracked = "?",
              deleted   = "D",
              ignored   = "!"
            },
          },
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
      live_filter = {
        always_show_folders = false,
      },
      ui = {
        confirm = {
          default_yes = true,
        },
      },
    }
  end,
}
