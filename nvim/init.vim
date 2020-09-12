if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/dotfiles/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/dotfiles/nvim/dein')
  call dein#begin('~/dotfiles/nvim/dein')

  let g:rc_dir    = expand("~/.config/nvim/")
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

set encoding=utf-8 "文字コード設定
set fenc=utf-8 "ファイル保存時の文字コード

set number "行番号を表示
set cursorline "カーソル行のハイライト
set cursorcolumn "カーソル列のハイライト
set virtualedit=onemore "行末の1文字先までカーソルを移動できるようにする

set smartindent "自動インデント
set autoindent "行追加時にカレントのインデントを引き継ぐ

set clipboard=unnamed "クリップボードの有効化
set tabstop=2 "タブの幅
set shiftwidth=2 "インデントの幅
set expandtab "タブをスペース化
set list "不可視文字を可視化
set listchars=eol:↲,extends:»,precedes:«,nbsp:% "不可視文字の表示設定

map <C-e> :NERDTreeToggle<CR>
map <C-k> :Files<CR>
map <C-j> :Rg<CR>
let NERDTreeShowLineNumbers=1

augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype eruby inoremap <buffer> </ </<C-x><C-o>
  autocmd BufNewFile,BufRead *.jbuilder set filetype=ruby
augroup END

colorscheme molokai
syntax on

