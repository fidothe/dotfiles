# basic setup
source ~/.sh-common/exports.sh
source ~/.zsh/options.zsh

# core UX
source ~/.zsh/prompt.zsh
source ~/.zsh/completion.zsh

# more advanced env setup
source ~/.sh-common/chruby.sh
source ~/.sh-common/virtualenv.sh
source ~/.sh-common/heroku.sh
source ~/.sh-common/aliases.sh

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
