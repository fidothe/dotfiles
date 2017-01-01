export LC_CTYPE=en_GB.UTF-8
export EDITOR=vim
export GIT_EDITOR="vim -f"
export BUNDLER_EDITOR=vim
export NODE_PATH="/usr/local/lib/node_modules:${NODE_PATH}"
export CLICOLOR=1
# If we have homebrew installed CA bundle
if [ -f /usr/local/opt/curl-ca-bundle/share/ca-bundle.crt ]; then
  export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
fi
export GOPATH=${HOME}/Documents/work/go
export ANDROID_TOOLS_PATH=${HOME}/Library/Android/sdk/platform-tools
export PATH="${GOPATH}/bin:${ANDROID_TOOLS_PATH}:/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:${PATH}"
