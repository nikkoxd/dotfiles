local M = {}

M.get_colorscheme = function()
	local ghostty_theme = vim.fn.system("ghostty +show-config | awk -F= '/theme/ { print $2 }'"):match("^%s*(.-)%s*$")

	local translations = {
        ["Rose Pine"] = "rose-pine",
        ["Vesper"] = "vesper",
		["tokyonight_moon"] = "tokyonight-moon",
		["tokyonight_night"] = "tokyonight-night",
		["Kanagawa Dragon"] = "kanagawa-dragon",
		["Kanagawa Wave"] = "kanagawa-wave",
		["GruvboxDark"] = "gruvbox",
		["GitHub Dark"] = "github_dark_tritanopia",
		["GitHub-Dark-Colorblind"] = "github_dark_colorblind",
		["GitHub-Dark-Default"] = "github_dark_default",
		["GitHub-Dark-Dimmed"] = "github_dark_dimmed",
		["GitHub-Dark-High-Contrast"] = "github_dark_high_contrast",
		["Github"] = "github_light_tritanopia",
		["GitHub-Light-Colorblind"] = "github_light_colorblind",
		["GitHub-Light-Default"] = "github_light_default",
		["GitHub-Light-High-Contrast"] = "github_light_high_contrast",
	}

	local colorscheme = translations[ghostty_theme] or ghostty_theme

	return colorscheme
end

local shared_colorscheme_path = vim.fn.stdpath("data") .. "/current_colorscheme"

local function save_colorscheme(name)
	local file = io.open(shared_colorscheme_path, "w")
	if file then
		file:write(name)
		file:close()
	end
end

M.set_colorscheme = function()
	local colorscheme = M.get_colorscheme()

	vim.o.background = "dark"
	vim.cmd("colorscheme " .. colorscheme)

    vim.cmd("hi Normal guibg=NONE ctermbg=NONE")

	save_colorscheme(colorscheme)
end

return M
