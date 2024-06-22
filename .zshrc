# env vars
export PATH=$PATH:~/.spoof-dpi/bin:~/pickup/target/release
export ZSH="$HOME/.oh-my-zsh"

# omz theme and plugins
ZSH_THEME="nikko"
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

# aliases
alias ls="eza"
alias cd="z"

# bun completions
[ -s "/Users/nikko/.bun/_bun" ] && source "/Users/nikko/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
