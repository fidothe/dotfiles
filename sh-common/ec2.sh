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
