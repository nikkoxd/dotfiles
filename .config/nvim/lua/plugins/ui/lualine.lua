return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "meuter/lualine-so-fancy.nvim",
    "letieu/harpoon-lualine",
  },

  opts = function()
    return {
      options = {
        theme = "neopywal",
        component_separators = "",
        section_separators = {
          left = "",
          right = ""
        },
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          {
            "fancy_mode",
            separator = {
              left = "",
              right = "",
            },
          },
        },
        lualine_b = {
          {
            "fancy_branch",
            padding = {
              left = 2,
              right = 2,
            },
          },
        },
        lualine_c = {
          {
            "fancy_cwd",
            substitute_home = true,
            padding = {
              left = 2,
            }
          },
          {
            "diagnostics",
            padding = {
              left = 2,
              right = 1,
            }
          },
        },
        lualine_x = {
          "harpoon2",
          "fancy_lsp_servers",
          {
            "diff",
            padding = {
              left = 1,
              right = 2,
            }
          },
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
          {
            "filetype",
            separator = {
              left = "",
            },
            padding = {
              left = 2,
              right = 2,
            }
          }
        },
        lualine_z = {
          {
            "progress",
            separator = {
              left = "",
              right = ""
            },
          },
        }
      }
    }
  end,
}
