#!/bin/sh

cd ~
git clone git@github.com:fidothe/dotfiles.git

cd dotfiles
./dotfiles-install

# vim setup - initial plugin install
vim -u ${HOME}/.vim/bundles.vim +PluginInstall +qall
