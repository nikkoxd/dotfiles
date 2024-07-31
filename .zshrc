# env vars
export PATH=$PATH:~/.spoof-dpi/bin:~/pickup/target/release:~/Library/Python/3.10/lib/python/site-packages
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"

# omz theme and plugins
ZSH_THEME="nikko"
plugins=(
  zsh-autosuggestions
  zoxide
)

# initialize omz
source $ZSH/oh-my-zsh.sh

# aliases
alias ls="eza"
alias cd="z"
alias toggleconda='eval "$(/Users/nikko/anaconda3/bin/conda shell.zsh hook)"'
alias python="python3"
alias fwal="fixed-wal"

source "$HOME/.cache/wal/colors.sh"

# custom functions
fixed-wal() {
  local imagePath="$(pwd)/$@"
  wal -n -s -i "$@" --cols16 lighten

  # set wallpaper and restart dock
  /usr/libexec/PlistBuddy -c "set AllSpacesAndDisplays:Desktop:Content:Choices:0:Files:0:relative file:///$imagePath" ~/Library/Application\ Support/com.apple.wallpaper/Store/Index.plist
  killall WallpaperAgent

  # reload apps
  # kill -SIGUSR1 $(pgrep kitty)
  sketchybar --reload
  brew services restart borders
}

yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# bun completions
[ -s "/Users/nikko/.bun/_bun" ] && source "/Users/nikko/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# run fastfetch lol
fastfetch

eval $(thefuck --alias)
