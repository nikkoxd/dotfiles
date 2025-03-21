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
        },
        lualine_b = {
          {
            "filetype",
            icon_only = true,
            padding = {
              left = 2,
              right = 0,
            },
          },
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
        },
        lualine_y = {
          {
            "branch",
            icons_enabled = false,
          },
          {
            "progress",
            fmt = function(s) return string.lower(s) end,
          },
          {
            "location",
            padding = {
              left = 0,
              right = 2,
            },
          }
        },
        lualine_z = {
        }
      }
    }
  end,
}
