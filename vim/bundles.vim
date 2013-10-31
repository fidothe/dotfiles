set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-rails.git'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'tpope/vim-commentary.git'
Bundle 'vim-scripts/actionscript.vim--Leider.git'
Bundle 'rodjek/vim-puppet.git'
Bundle 'othree/html5.vim.git'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'SirVer/ultisnips.git'
Bundle 'mileszs/ack.vim.git'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
" Bundle 'L9'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
" Bundle 'file:///Users/gmarik/path/to/plugin'

" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
