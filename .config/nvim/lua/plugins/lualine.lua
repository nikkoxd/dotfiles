return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"echasnovski/mini.icons",
	},

    return {
      options = {
        theme = function()
            local colorscheme = require("config.vars").colorscheme
            if colorscheme == "neopywal" then
                return "custom_neopywal"
            else
                return colorscheme
            end
        end,
        component_separators = "",
        section_separators = "",
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              return string.sub(str, 1, 1):upper()
            end,
          }
        },
        lualine_b = {
          {
            "filetype",
            icon_only = true,
            padding = {
              left = 2,
            },
          },
          {
            "filename",
            symbols = {
              modified = "(modified)",
              readonly = "(readonly)",
              unnamed = "unnamed",
              newfile = "new",
            },
          },
          {
            "lsp_status",
            icon = "",
            color = "lualine_lsp",
            padding = {
              left = 0,
            }
          },
        },
        lualine_c = {
          "diagnostics",
        },
        lualine_x = {
          "overseer",
          {
            "branch",
            icon = { "", color = "lualine_icon_branch" }
          },
        },
        lualine_y = {
          "progress",
        },
        lualine_z = {
          "location",
        }
      }
    }
  end,
}
