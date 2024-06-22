PROMPT="%(?:%{$fg_bold[blue]%}%1{➜%} :%{$fg_bold[magenta]%}%1{➜%} ) "

RPS1="%{$reset_color%}%c\$(git_prompt_info)"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}@"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[magenta]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
