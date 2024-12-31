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
          "diagnostics",
        },
        lualine_x = {
          {
            "branch",
            icons_enabled = false,
          },
          "encoding",
          {
            "fileformat",
            icons_enabled = false,
          }
        },
        lualine_y = {
          function()
            local progress = require("lualine.components.progress")
            return string.lower(progress())
          end,
        },
        lualine_z = {
          {
            "location",
          }
        }
      }
    }
  end,
}
