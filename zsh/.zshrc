source $(brew --prefix)/share/antigen/antigen.zsh

# history
HISTFILE=~/.zsh_history

# source other parts of the config
source "$HOME/.cache/wal/colors.sh"
source "$HOME/.config/zsh/aliases.zsh"
source "$HOME/.config/zsh/exports.zsh"
source "$HOME/.config/zsh/functions.zsh"

# plugins
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle jeffreytse/zsh-vi-mode

# clis
eval "$(zoxide init zsh)"
eval $(thefuck --alias)

# useful options (wip)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef
zle_highlight=("paste:none")

# version control
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


# bun completions
[ -s "/Users/nikko/.bun/_bun" ] && source "/Users/nikko/.bun/_bun"

antigen apply
