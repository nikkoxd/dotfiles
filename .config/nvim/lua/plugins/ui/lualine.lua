return {
  "nvim-lualine/lualine.nvim",

  opts = function()
    local has_neopywal, neopywal_lualine = pcall(require, "neopywal.theme.plugins.lualine")
    if not has_neopywal then
      return
    end

    neopywal_lualine.setup()

    return {
      options = {
        theme = "neopywal",
        component_separators = "",
        section_separators = {
          left = "",
          right = ""
        },
      },
      winbar = {
        lualine_c = {
          { "navic" }
        }
      },
      sections = {
        lualine_a = {
          {
            "mode",
            separator = {
              left = "",
              right = "",
            },
          }
        },
        lualine_b = {
          {
            "filetype",
            icon_only = true,
            padding = {
              left = 2,
              right = 0,
            }
          },
          {
            "filename",
            symbols = {
              modified = "󰧞",
              readonly = "󰌾",
              unnamed = "Unnamed",
              newfile = "New file",
            }
          },
        },
        lualine_c = {
          {
            "diagnostics",
            padding = {
              left = 2,
              right = 1,
            }
          },
        },
        lualine_x = {
          {
            'fileformat',
            symbols = {
              unix = 'LF',
              dos = 'CRLF',
              mac = 'CR',
            },
          },
          {
            "encoding"
          },
          {
            "diff",
            padding = {
              left = 1,
              right = 2,
            }
          },
        },
        lualine_y = {
          {
            "branch",
            icon = ""
          },
          {
            "progress",
            padding = {
              left = 2,
              right = 2,
            }
          },
        },
        lualine_z = {
          {
            "location",
            separator = {
              left = "",
              right = ""
            },
          }
        }
      }
    }
  end,
}
