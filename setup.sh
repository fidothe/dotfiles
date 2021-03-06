#!/bin/sh

cd ~
git clone git@github.com:fidothe/dotfiles.git

cd dotfiles
./dotfiles-install

# shell setup
if which apt-get; then
  sudo apt-get install -y zsh
  sudo chsh -s /usr/bin/zsh `whoami`
fi

# Silver Searcher
if which apt-get; then
  sudo apt-get install -y silversearcher-ag
fi

# vim setup - initial plugin install
vim -u ${HOME}/.vim/bundles.vim +PluginInstall +qall

# git setup
git config --global core.excludesfile ${HOME}/.gitignore_global
