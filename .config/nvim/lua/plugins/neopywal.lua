local vars = require("config.vars")

return {
  "RedsXDD/neopywal.nvim",
  name = "neopywal",
  lazy = false,
  priority = 1000,
  keys = {
    { "<leader>nc", "<cmd>NeopywalCompile<cr>", desc = "Recompile neopywal" },
  },
  opts = {
    transparent_background = vars.transparency,
    show_split_lines = false,
    dim_inactive = true,
    show_end_of_buffer = true,
    custom_highlights = function(C)
      return {
        all = {
          NormalFloat = { bg = C.background },
          FloatBorder = { bg = C.background, fg = C.background },
          FloatTitle = { bg = C.background, fg = C.color4 },

          NotifyERRORBody = { bg = C.background },
          NotifyWARNBody = { bg = C.background },
          NotifyINFOBody = { bg = C.background },
          NotifyDEBUGBody = { bg = C.background },
          NotifyTRACEBody = { bg = C.background },

          NotifyERRORIcon = { bg = C.background, fg = C.color4 },
          NotifyWARNIcon = { bg = C.background, fg = C.color3 },
          NotifyINFOIcon = { bg = C.background, fg = C.color2 },
          NotifyDEBUGIcon = { bg = C.background, fg = C.color7 },
          NotifyTRACEIcon = { bg = C.background, fg = C.color6 },

          NotifyERRORBorder = { bg = C.background, fg = C.background },
          NotifyWARNBorder = { bg = C.background, fg = C.background },
          NotifyINFOBorder = { bg = C.background, fg = C.background },
          NotifyDEBUGBorder = { bg = C.background, fg = C.background },
          NotifyTRACEBorder = { bg = C.background, fg = C.background },

          MiniFilesTitle = { bg = C.background, fg = C.color8 },

          WhichKey = { bg = C.background },

          EndOfBuffer = { fg = C.background },
          ColorColumn = { bg = C.background },

          Pmenu = { bg = C.background },
          PmenuSel = { bg = C.color4, fg = C.color0 },

          CmpItemAbbrDeprecated = { fg = C.color7, strikethrough = true },
          CmpItemMenu = { fg = C.color7, italic = true },

          -- CmpItemKindField = { fg = C.color0, bg = C.color4 },
          -- CmpItemKindProperty = { fg = C.color0, bg = C.color4 },
          -- CmpItemKindEvent = { fg = C.color0, bg = C.color4 },

          -- CmpItemKindText = { fg = C.color0, bg = C.color3 },
          -- CmpItemKindEnum = { fg = C.color0, bg = C.color3 },
          -- CmpItemKindKeyword = { fg = C.color0, bg = C.color3 },

          -- CmpItemKindConstant = { fg = C.color0, bg = C.color2 },
          -- CmpItemKindConstructor = { fg = C.color0, bg = C.color2 },
          -- CmpItemKindReference = { fg = C.color0, bg = C.color2 },

          -- CmpItemKindFunction = { fg = C.color0, bg = C.color1 },
          -- CmpItemKindStruct = { fg = C.color0, bg = C.color1 },
          -- CmpItemKindClass = { fg = C.color0, bg = C.color1 },
          -- CmpItemKindModule = { fg = C.color0, bg = C.color1 },
          -- CmpItemKindOperator = { fg = C.color0, bg = C.color1 },

          -- CmpItemKindVariable = { fg = C.color0, bg = C.color5 },
          -- CmpItemKindFile = { fg = C.color0, bg = C.color5 },

          -- CmpItemKindUnit = { fg = C.color0, bg = C.color6 },
          -- CmpItemKindSnippet = { fg = C.color0, bg = C.color6 },
          -- CmpItemKindFolder = { fg = C.color0, bg = C.color6 },

          -- CmpItemKindMethod = { fg = C.color0, bg = C.color7 },
          -- CmpItemKindValue = { fg = C.color0, bg = C.color7 },
          -- CmpItemKindEnumMember = { fg = C.color0, bg = C.color7 },

          -- CmpItemKindInterface = { fg = C.color0, bg = C.color8 },
          -- CmpItemKindColor = { fg = C.color0, bg = C.color8 },
          -- CmpItemKindTypeParameter = { fg = C.color0, bg = C.color8 },
        },
      }
    end,
    plugins = {
      gitsigns = true,
      harpoon = true,
      neogit = true,
      trouble = true,
    }
  }
}
