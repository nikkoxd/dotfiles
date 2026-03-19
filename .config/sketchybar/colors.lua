local settings = require("settings")

if settings.theme == "matugen" then
  local theme = require("themes.matugen")
  return theme
elseif settings.theme == "pywal" then
  local theme = require("themes.pywal")
  return theme
end
