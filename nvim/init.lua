require("config.remap")
require("config.autocmds")
require("config.opts")
require("config.lazy")

local langmapper = require("langmapper")
langmapper.automapping({ buffer = false })
