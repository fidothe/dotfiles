common_shell_includes=$HOME/.sh-common
source $common_shell_includes/exports.sh

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

source $common_shell_includes/ec2.sh
source $common_shell_includes/virtualenv.sh
source $common_shell_includes/rbenv.sh
source $common_shell_includes/heroku.sh

# travis CI
source $common_shell_includes/travis.sh
