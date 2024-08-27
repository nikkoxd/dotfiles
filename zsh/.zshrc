source $(brew --prefix)/share/antigen/antigen.zsh

# history
HISTFILE=~/.zsh_history

# completion
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi
autoload -Uz compinit
compinit -i

# source other parts of the config
source "$HOME/.cache/wal/colors.sh"
source "$HOME/.config/zsh/aliases.zsh"
source "$HOME/.config/zsh/exports.zsh"
source "$HOME/.config/zsh/functions.zsh"

# plugins
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle jeffreytse/zsh-vi-mode
antigen bundle atuinsh/atuin@main

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
  echo
}
zstyle ":vcs_info:git:*" formats "%b"

# set custom prompt
setopt PROMPT_SUBST
PROMPT=' $(command_result) '
RPROMPT='$(path)$(git_info)' # for some reason double quotes are broken here
command_result() {
  if [[ $? == 0 ]]; then
    echo "%F{blue}%F{black}%K{blue}󰧞%F{blue}%k%f"
  else
    echo "%F{red}%F{black}%K{red}✖%F{red}%k%f"
  fi
}
path() {
  if [[ ${vcs_info_msg_0_} == "" ]]; then
    echo "%F{black}%F{blue}%K{black}%1~%F{black}%k"
  else
    echo "%F{black}%F{blue}%K{black}%1~%F{black}"
  fi
}
git_info() {
  if [[ ${vcs_info_msg_0_} != "" ]]; then
    if [[ -n $(git status -s --ignore-submodules=dirty 2> /dev/null) ]]; then
      echo "%F{red}%F{black}%K{red}${vcs_info_msg_0_}*%F{red}%k"
    else
      echo "%F{blue}%F{black}%K{blue}${vcs_info_msg_0_}%F{blue}%k"
    fi
  fi
}
git_dirty() {
  if [[ -n $(git status -s --ignore-submodules=dirty 2> /dev/null) ]]; then
    echo "%F{red}*%f"
  fi
}


# bun completions
[ -s "/Users/nikko/.bun/_bun" ] && source "/Users/nikko/.bun/_bun"

antigen apply
