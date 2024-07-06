PROMPT="%(?:%{$fg_bold[pink]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} )%{$reset_color%} "

RPS1="%{$reset_color%}%c\$(git_prompt_info)"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}@"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""
