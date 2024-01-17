
function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    svn info >/dev/null 2>/dev/null && echo '⚡' && return
}

PROMPT='%{$fg_bold[red]%}%n%{$reset_color%}@%{$fg_bold[blue]%}%m %{$fg_bold[white]%}%~%{$reset_color%}$(git_prompt_info)
%{$fg_bold[green]%}$(prompt_char):%# %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} [dirty]"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%} [untracked]"
ZSH_THEME_GIT_PROMPT_CLEAN=""
