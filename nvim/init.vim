if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  let g:deoplete#enable_at_startup = 1
  call dein#add('mattn/emmet-vim')
  call dein#add('Yggdroot/indentLine')
  call dein#add('bronson/vim-trailing-whitespace')
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

set number
set fenc=utf-8
set cursorline
set cursorcolumn
set virtualedit=onemore
set smartindent
set clipboard=unnamed
set autoindent
set encoding=utf-8
set tabstop=2
set shiftwidth=2
set expandtab
set list
"set listchars=eol:↲
set listchars=eol:↲,extends:»,precedes:«,nbsp:%,space:-
colorscheme molokai
syntax on

