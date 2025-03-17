# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# source brew helper functions
source ~/.sh-common/brew-helpers.sh

# basic setup
source ~/.sh-common/exports.sh
source ~/.zsh/options.zsh
source ~/.zsh/prompt.zsh

# enable completions from brew
if brew_up; then
  FPATH=$(brew_prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi


# core UX
source ~/.zsh/completion.zsh

# more advanced env setup
source ~/.sh-common/chruby.sh
source ~/.sh-common/pyenv.sh
source ~/.sh-common/nvm.sh
source ~/.sh-common/virtualenv.sh
source ~/.sh-common/heroku.sh
source ~/.sh-common/aliases.sh
source ~/.sh-common/dotnet.sh
source ~/.sh-common/docker.sh

# stuff we don't want to commit
if [ -d ~/.sh-extras ]; then
  for extra in ~/.sh-extras/*.sh; do
    source $extra
  done
fi

# travis CI
source ~/.sh-common/travis.sh

# iTerm2 shell integration
if [ -f ~/.iterm2_shell_integration.zsh ]; then
  source ~/.iterm2_shell_integration.zsh
fi
