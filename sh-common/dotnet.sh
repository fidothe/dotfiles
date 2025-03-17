if [ -d "$(brew_prefix)/opt/dotnet@6" ]; then
  export DOTNET_ROOT="$(brew_prefix)/opt/dotnet@6/libexec"
  export PATH="$(brewish_prepend_path "${PATH}" opt/dotnet@6/bin)"
fi
