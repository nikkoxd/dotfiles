# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

# omz theme and plugins
ZSH_THEME="jovial"
plugins=(
  git
  autojump
  urltools
  bgnotify
  zsh-autosuggestions
  jovial
  z
)

# omz path
source $ZSH/oh-my-zsh.sh

# env vars
export PATH=$PATH:~/.spoof-dpi/bin:~/pickup/target/release

# aliases
alias ls="eza"
alias cd="z"

# bun completions
[ -s "/Users/nikko/.bun/_bun" ] && source "/Users/nikko/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


export HOMEBREW_NO_AUTO_UPDATE=true
