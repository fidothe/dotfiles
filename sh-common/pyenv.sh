if [ -d "$HOME/.pyenv" ]; then
  export PYENV_ROOT=$HOME/.pyenv
  eval "$(pyenv init -)"
fi
