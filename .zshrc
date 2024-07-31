HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# env vars
export PATH=$PATH:~/.spoof-dpi/bin:~/pickup/target/release:~/Library/Python/3.10/lib/python/site-packages
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# load version control
autoload -Uz vcs_info
precmd() { 
  vcs_info 
}
zstyle ":vcs_info:git:*" formats "@%b"

# set custom prompt
setopt PROMPT_SUBST
PROMPT="%(?:%F{blue}:%F{red})➜  %f"
RPROMPT='%F{yellow}%1~%f%F{blue}${vcs_info_msg_0_}%f$(parse_git_dirty)' # for some reason double quotes are broken here
parse_git_dirty() {
  if [[ -n $(git status -s --ignore-submodules=dirty 2> /dev/null) ]]; then
    echo "%F{red}*%f"
  fi
}

# initialize clis
eval "$(zoxide init zsh)"
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
eval $(thefuck --alias)

# aliases
alias ~="cd ~"
alias ..="cd ../"
alias ls="eza"
alias cd="z"
alias python="python3"
alias fwal="fixed-wal"
alias lg="lazygit"

# source pywal colors
source "$HOME/.cache/wal/colors.sh"

# functions
fixed-wal() {
  local imagePath="$(pwd)/$@"
  wal -n -s -i "$@" --cols16 lighten

  # set wallpaper and restart dock
  /usr/libexec/PlistBuddy -c "set AllSpacesAndDisplays:Desktop:Content:Choices:0:Files:0:relative file:///$imagePath" ~/Library/Application\ Support/com.apple.wallpaper/Store/Index.plist
  killall WallpaperAgent

  # reload apps
  sketchybar --reload
  brew services restart borders
  spicetify apply
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

# run fastfetch lol
fastfetch
