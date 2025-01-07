local vars = require("config.vars")

return {
  "rose-pine/neovim",
  name = "rose-pine",
  opts = {
    styles = {
      transparency = vars.transparency,
    }
  }
}
