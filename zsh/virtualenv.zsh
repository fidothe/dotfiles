VENV_WRAPPER_SCRIPT="/usr/local/share/python/virtualenvwrapper.sh"
if [[ -d "$HOME/.virtualenvs" && -f $VENV_WRAPPER_SCRIPT ]]; then
  export WORKON_HOME=$HOME/.virtualenvs
  export PIP_VIRTUALENV_BASE=$WORKON_HOME
  export PIP_RESPECT_VIRTUALENV=true
  source $VENV_WRAPPER_SCRIPT
fi
