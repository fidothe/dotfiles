common_shell_includes=$HOME/.sh-common
source $common_shell_includes/brew-helpers.sh
source $common_shell_includes/exports.sh

if brew_up && [ -f "$(brew_prefix)/etc/bash_completion" ]; then
  . "$(brew_prefix)/etc/bash_completion"
fi

source $common_shell_includes/virtualenv.sh
source $common_shell_includes/chruby.sh
source $common_shell_includes/heroku.sh

# travis CI
source $common_shell_includes/travis.sh

# stuff we don't want to commit
if [ -d ~/.sh-extras ]; then
  for extra in ~/.sh-extras/*.sh; do
    source $extra
  done
fi

# iTerm2 shell integration
if [ -f ~/.iterm2_shell_integration.bash ]; then
  source ~/.iterm2_shell_integration.bash
fi
