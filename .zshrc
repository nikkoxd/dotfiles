HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

source "$HOME/.cache/wal/colors.sh"
source "$HOME/.config/zsh/aliases.zsh"
source "$HOME/.config/zsh/exports.zsh"
source "$HOME/.config/zsh/functions.zsh"

# load version control
autoload -Uz vcs_info
precmd() { 
  vcs_info 
}
zstyle ":vcs_info:git:*" formats "@%b"

# set custom prompt
setopt PROMPT_SUBST
PROMPT="%(?:%F{blue}:%F{red})➜  %f"
RPROMPT='%F{blue}%1~%f%F{gray}${vcs_info_msg_0_}%f$(parse_git_dirty)' # for some reason double quotes are broken here
parse_git_dirty() {
  if [[ -n $(git status -s --ignore-submodules=dirty 2> /dev/null) ]]; then
    echo "%F{red}*%f"
  fi
}

# initialize clis
eval "$(zoxide init zsh)"
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
eval $(thefuck --alias)

# bun completions
[ -s "/Users/nikko/.bun/_bun" ] && source "/Users/nikko/.bun/_bun"

fastfetch
