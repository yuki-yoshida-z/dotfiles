if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/dotfiles/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/dotfiles/nvim/dein')
  call dein#begin('~/dotfiles/nvim/dein')

  call dein#add('~/dotfiles/nvim/dein')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  let g:deoplete#enable_at_startup = 1
  call dein#add('mattn/emmet-vim')
  call dein#add('Yggdroot/indentLine')
  call dein#add('bronson/vim-trailing-whitespace')
  call dein#add('slim-template/vim-slim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('cohama/lexima.vim')
  call dein#add('scrooloose/nerdtree')
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
set noshowmode
map <C-e> :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=1
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype eruby inoremap <buffer> </ </<C-x><C-o>
augroup END
colorscheme molokai
syntax on

