mkcd() { 
  mkdir $1
  cd $1
}

yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

reload_configs() {
  osascript ~/.config/ghostty/reload.scpt

  sketchybar --reload &
  nvim --headless \
    -c 'lua require("config.colorscheme").set_colorscheme()' \
    -c 'qa' &

  wait
}
