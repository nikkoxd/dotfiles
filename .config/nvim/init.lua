require("config.remap")
require("config.autocmds")
require("config.opts")
require("config.lazy")
require("config.colorscheme")

local langmapper = require("langmapper")
langmapper.automapping({ global = true, buffer = false })
