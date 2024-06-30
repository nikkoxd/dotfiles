# env vars
export PATH=$PATH:~/.spoof-dpi/bin:~/pickup/target/release:~/Library/Python/3.10/lib/python/site-packages
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"

# omz theme and plugins
ZSH_THEME="nikko"
plugins=(
  git
  autojump
  urltools
  bgnotify
  zsh-autosuggestions
  zoxide
)
ZLE_RPROMPT_INDENT=0

# omz path
source $ZSH/oh-my-zsh.sh

# aliases
alias ls="eza"
alias cd="z"
alias toggleconda='eval "$(/Users/nikko/anaconda3/bin/conda shell.zsh hook)"'
alias pip="pip3"
alias python="python3"

# custom functions
wal-set() {
  wal -n -i "$@"
  local imagePath="$(pwd)/$1"
  
  osascript -e '
    tell application "System Events"
      repeat with desktopIndex from 1 to count of desktops
        set picture of desktop desktopIndex to POSIX file "'"$imagePath"'"
      end repeat
    end tell
  '
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
