ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}|%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{$fg_bold[white]%}%1~%{$reset_color%}$(git_prompt_info)%{$fg_bold[yellow]%}❯%{$fg_bold[cyan]%}❯%{$fg_bold[red]%}❯%{$reset_color%} '
