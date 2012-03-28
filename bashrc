export LC_CTYPE=en_GB.UTF-8
export EDITOR=vim
export GIT_EDITOR="vim -f"
export BUNDLER_EDITOR=vim
export PATH="/usr/local/share/python:/usr/local/bin:${PATH}"
export NODE_PATH="/usr/local/lib/node_modules:${NODE_PATH}"
export CLICOLOR=1

# For AWS command line tools
if [[ -d "$HOME/.ec2" ]]; then
  export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
  export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
  export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"
fi
if [[ -d "/usr/local/Cellar/ec2-api-tool" ]]; then
  export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.4.4.1/jars"
fi
if [[ -d "/usr/local/Cellar/auto-scaling" ]]; then
  export AWS_AUTO_SCALING_HOME="/usr/local/Cellar/auto-scaling/1.0.39.0/jars"
fi
if [[ -d "/usr/local/Cellar/ec2-ami-tools" ]]; then
  export EC2_AMITOOL_HOME="/usr/local/Cellar/ec2-ami-tools/1.3-45758/jars"
fi

VENV_WRAPPER_SCRIPT="/usr/local/share/python/virtualenvwrapper.sh"
if [[ -d "$HOME/.virtualenvs" && -f $VENV_WRAPPER_SCRIPT ]]; then
  export WORKON_HOME=$HOME/.virtualenvs
  export PIP_VIRTUALENV_BASE=$WORKON_HOME
  export PIP_RESPECT_VIRTUALENV=true
  source $VENV_WRAPPER_SCRIPT
fi

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
  export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
fi
