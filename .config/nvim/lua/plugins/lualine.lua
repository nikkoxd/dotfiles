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
            "filename",
            symbols = {
              modified = "(modified)",
              readonly = "(readonly)",
              unnamed = "unnamed",
              newfile = "new",
            },
            padding = {
              left = 2,
            },
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
        },
        lualine_y = {
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
