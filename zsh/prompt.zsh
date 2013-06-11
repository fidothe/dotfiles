# totally stolen from Sven :-) https://github.com/svenfuchs/dotfiles/blob/master/.zsh/lib/prompt.zsh

setopt prompt_subst
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats       ' [%b%c%u]'
zstyle ':vcs_info:git:*' actionformats ' [%b%c%u | %a}'
zstyle ':vcs_info:git:*' unstagedstr   "%{$fg[red]%}⚡%{$reset_color%}"
zstyle ':vcs_info:git:*' stagedstr     "%{$fg[yellow]%}+%{$reset_color%}"
zstyle ':vcs_info:*' nvcsformats ''

# precmd is called just before the prompt is printed
function precmd() { vcs_info }

PS1='%1~${vcs_info_msg_0_} $ '
