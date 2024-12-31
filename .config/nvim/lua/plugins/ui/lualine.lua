return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = function()
    return {
      options = {
        theme = "custom_neopywal",
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
            "branch",
            icon = "branch:",
          },
        },
        lualine_c = {
          "diff",
        },
        lualine_x = {
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
        },
        lualine_y = {
          "diagnostics",
          {
            "filename",
            path = 1,
            symbols = {
              modified = "(modified)",
              readonly = "(readonly)",
              unnamed = "unnamed",
              newfile = "new",
            }
          },
        },
        lualine_z = {
          function()
            local progress = require("lualine.components.progress")
            return string.lower(progress())
          end,
        }
      }
    }
  end,
}
