export GIT_EDITOR='mvim -f --nomru -c "au VimLeave * !open -a Terminal"'
export EDITOR=mvim
export PATH="/usr/local/share/python:/usr/local/bin:${PATH}"

VENV_WRAPPER_SCRIPT="/usr/local/share/python/virtualenvwrapper.sh"
if [[ -d "$HOME/.virtualenvs" && -f $VENV_WRAPPER_SCRIPT ]]; then
  export WORKON_HOME=$HOME/.virtualenvs
  export PIP_VIRTUALENV_BASE=$WORKON_HOME
  export PIP_RESPECT_VIRTUALENV=true
  source $VENV_WRAPPER_SCRIPT
fi


[[ -s "/Users/matt/.rvm/scripts/rvm" ]] && source "/Users/matt/.rvm/scripts/rvm"  # This loads RVM into a shell session.



