export LC_CTYPE=en_GB.UTF-8
export EDITOR=nvim
export GIT_EDITOR="code --wait"
export BUNDLER_EDITOR=nvim
export NODE_PATH=$(brewish_prepend_path "${NODE_PATH}" lib/node_modules)
export CLICOLOR=1
# If we have homebrew installed CA bundle
if brew_up && [ -f "$(brew_prefix)/opt/curl-ca-bundle/share/ca-bundle.crt" ]; then
  export SSL_CERT_FILE="$(brew_prefix)/opt/curl-ca-bundle/share/ca-bundle.crt"
fi
export GOPATH=${HOME}/Documents/work/go
export ANDROID_TOOLS_PATH=${HOME}/Library/Android/sdk/platform-tools
export PATH="${GOPATH}/bin:${ANDROID_TOOLS_PATH}:$(brewish_prepend_path "${PATH}" share/npm/bin bin)"

export HISTSIZE=1000
export SAVEHIST=10000
