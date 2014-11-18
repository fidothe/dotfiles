" load Pathogen for the oddly-supplied Go plugins
execute pathogen#infect('pathogen_style/{}')

" matchit
runtime macros/matchit.vim
" load Vundle config
source $HOME/.vim/bundles.vim

" line numbers
set number
set ruler
" syntax highlighting
syntax on

" Tabses and such
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set listchars=tab:▸\ ,trail:·

" Autocommands
augroup mattCommands
  " Clear all autocmds in the group
  autocmd!
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Filetypes
  " Use .as for ActionScript files, not Atlas files.
  autocmd BufNewFile,BufRead *.as set filetype=actionscript

  " Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
  autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

  " RSpec spec files
  autocmd BufRead,BufNewFile *_spec.rb set ft=rspec.ruby


  " md, markdown, and mk are markdown and define buffer-local preview
  autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} set ft=markdown

  " add json syntax highlighting
  autocmd BufNewFile,BufRead *.json set ft=javascript
  
  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
  "for python, autoindent with four spaces, always expand tabs
  autocmd FileType python set ai sw=4 sts=4 et

  " Old-school SASS
  autocmd! BufRead,BufNewFile *.sass set ft=sass

  " Buster.js spec files
  autocmd BufRead,BufNewFile *_spec.js set ft=buster.javascript

  " HTML ERB should be HTML too
  autocmd! BufRead,BufNewFile *.html.erb set ft=eruby.html

  "for Go, always use tabs
  autocmd FileType go set ai noet
augroup END

" Directories for swp files
" Store temporary files in a central spot
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" display incomplete commands
set showcmd

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" highlight current line
set cursorline
set cmdheight=2
set switchbuf=useopen
set numberwidth=5
set showtabline=2
set winwidth=79
set shell=bash
" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=
" keep more context when scrolling off the end of a buffer
set scrolloff=3

" make the split with focus big...
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=5
set winminheight=5
set winheight=999

" Solarized colour scheme
" invisibles contrast = low
" let g:solarized_visibility="low"
" diffmode colours
let g:solarized_diffmode="high"
syntax enable
set background=light
colorscheme solarized

" speed up switching between last two windows
map <leader>` <c-^>

" TDD stuff (adapted from @garybernhardt)
function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo
    if &filetype =~ "ruby"
        exec ":!bundle exec rspec " . a:filename
    elseif &filetype =~ "javascript"
        exec ":!buster test -t " . a:filename
    endif
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! CheckTestFile(file_suffix)
    let in_spec_file = match(expand("%"), a:file_suffix . '$') != -1
    if in_spec_file
        call SetTestFile()
    end
endfunction

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    if &filetype =~ "ruby"
        call CheckTestFile("_spec.rb")
    elseif &filetype =~ "javascript"
        call CheckTestFile("_spec.js")
    endif

    if !exists("t:grb_test_file")
        return
    endif

    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number)
endfunction

" Run this file
map <leader>t :call RunTestFile()<cr>
" Run only the example under the cursor
map <leader>T :call RunNearestTest()<cr>
" Run all test files
map <leader>a :call RunTests('spec')<cr>

" Routes & Gemfile
map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>

function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! bundle exec rake -s routes
  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . "_ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
endfunction
map <leader>gR :call ShowRoutes()<cr>

" Schema
map <leader>db :topleft :split db/schema.rb<cr>

" Strip all trailing whitespace
map <leader>ts :%s/\s\+$<cr>
