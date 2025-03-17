brew_up() {
  type "$(brew_path)" &>/dev/null
}

brew_path() {
  if type arch &>/dev/null && [[ $(arch) = "arm64" ]]; then
    echo "/opt/homebrew/bin/brew"
  else
    echo "/usr/local/bin/brew"
  fi
}

brew_prefix() {
  if type $(brew_path) &>/dev/null; then
    echo $($(brew_path) --prefix)
  fi
}


brewish_prepend_path() {
  prepended_path="$1"
  shift

  if brew_up; then
    for path_chunk in $@; do
      prepended_path="$(brew_prefix)/${path_chunk}:${prepended_path}"
    done
  fi

  echo "${prepended_path}"
}
