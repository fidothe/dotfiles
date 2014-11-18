# basic setup
source ~/.sh-common/exports.sh
source ~/.zsh/options.zsh

# core UX
source ~/.zsh/prompt.zsh
source ~/.zsh/completion.zsh

# more advanced env setup
source ~/.sh-common/exports.sh
source ~/.sh-common/rbenv.sh
source ~/.sh-common/virtualenv.sh
source ~/.sh-common/heroku.sh

# stuff we don't want to commit
if [ -d ~/.sh-extras ]; then
  for extra in ~/.sh-extras/*.sh; do
    source $extra
  done
fi
