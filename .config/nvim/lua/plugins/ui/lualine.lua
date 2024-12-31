return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = function()
    return {
      options = {
        theme = "custom_neopywal",
        icons_enabled = false,
        component_separators = "",
        section_separators = "",
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          function()
            local mode = require("lualine.utils.mode").get_mode()
            return string.lower(mode);
          end,
        },
        lualine_b = {
          {
            "filename",
            symbols = {
              modified = "(modified)",
              readonly = "(readonly)",
              unnamed = "unnamed",
              newfile = "new",
            }
          },
        },
        lualine_c = {
          "diff",
        },
        lualine_x = {
          "diagnostics",
          {
            function()
              local ret, _ = vim.bo.fileformat:gsub("^unix$", "")
              return ret
            end,
          },
          {
            function()
              local ret, _ = (vim.bo.fenc or vim.go.enc):gsub("^utf%-8$", "")
              return ret
            end,
          },
          "branch",
        },
        lualine_y = {
          function()
            local progress = require("lualine.components.progress")
            return string.lower(progress())
          end,
        },
        lualine_z = {
          "location",
        }
      }
    }
  end,
}
