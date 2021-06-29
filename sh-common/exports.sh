export LC_CTYPE=en_GB.UTF-8
export EDITOR=nvim
export GIT_EDITOR="code --wait"
export BUNDLER_EDITOR=nvim
export NODE_PATH="/usr/local/lib/node_modules:${NODE_PATH}"
export CLICOLOR=1
# If we have homebrew installed CA bundle
if [ -f /usr/local/opt/curl-ca-bundle/share/ca-bundle.crt ]; then
  export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
fi
export GOPATH=${HOME}/Documents/work/go
export ANDROID_TOOLS_PATH=${HOME}/Library/Android/sdk/platform-tools
export PATH="${GOPATH}/bin:${ANDROID_TOOLS_PATH}:/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:${PATH}"
export HISTSIZE=10000
export SAVEHIST=1000
export SAXON_HOME=/usr/local/opt/saxon
