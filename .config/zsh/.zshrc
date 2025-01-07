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
eval "$(thefuck --alias)"

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
zstyle ":vcs_info:git:*" formats "%b"

# set custom prompt
setopt PROMPT_SUBST
PROMPT=' $(path) $(command_result) '
RPROMPT='$(vi_mode) $(git_info)' # for some reason double quotes are broken here
command_result() {
  echo "%(?.%f.%F{blue})>%f"
}
path() {
  echo "%F{blue}%1~%f"
}
git_info() {
  if [[ ${vcs_info_msg_0_} != "" ]]; then
    if [[ -n $(git status -s --ignore-submodules=dirty 2> /dev/null) ]]; then
      echo "%F{blue}branch: %f${vcs_info_msg_0_}*"
    else
      echo "%F{blue}branch: %f${vcs_info_msg_0_}"
    fi
  fi
}
git_dirty() {
  if [[ -n $(git status -s --ignore-submodules=dirty 2> /dev/null) ]]; then
    echo "%F{red}*%f"
  fi
}
vi_mode() {
  case $ZVM_MODE in
    "$ZVM_MODE_NORMAL")
      echo "[n]"
      ;;
    "$ZVM_MODE_VISUAL")
      echo "[v]"
      ;;
    "$ZVM_MODE_VISUAL_LINE")
      echo "[l]"
      ;;
    "$ZVM_MODE_REPLACE")
      echo "[r]"
      ;;
  esac
}


# bun completions
[ -s "/Users/nikko/.bun/_bun" ] && source "/Users/nikko/.bun/_bun"

antigen apply

# pnpm
export PNPM_HOME="/Users/nikko/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
