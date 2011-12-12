export GIT_EDITOR='mvim -f --nomru -c "au VimLeave * !open -a Terminal"'
export EDITOR=mvim
export PATH="/usr/local/share/python:/usr/local/bin:${PATH}"

# For AWS command line tools
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.4.4.1/jars"
export AWS_AUTO_SCALING_HOME="/usr/local/Cellar/auto-scaling/1.0.39.0/jars"
export EC2_AMITOOL_HOME="/usr/local/Cellar/ec2-ami-tools/1.3-45758/jars"


VENV_WRAPPER_SCRIPT="/usr/local/share/python/virtualenvwrapper.sh"
if [[ -d "$HOME/.virtualenvs" && -f $VENV_WRAPPER_SCRIPT ]]; then
  export WORKON_HOME=$HOME/.virtualenvs
  export PIP_VIRTUALENV_BASE=$WORKON_HOME
  export PIP_RESPECT_VIRTUALENV=true
  source $VENV_WRAPPER_SCRIPT
fi


[[ -s "/Users/matt/.rvm/scripts/rvm" ]] && source "/Users/matt/.rvm/scripts/rvm"  # This loads RVM into a shell session.



