if g:dein#_cache_version !=# 100 || g:dein#_init_runtimepath !=# '/Users/yuki/.config/nvim,/etc/xdg/nvim,/Users/yuki/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/usr/local/Cellar/neovim/0.3.1/share/nvim/runtime,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Users/yuki/.local/share/nvim/site/after,/etc/xdg/nvim/after,/Users/yuki/.config/nvim/after,/Users/yuki/.cache/dein/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/yuki/.config/nvim/init.vim'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/yuki/.cache/dein'
let g:dein#_runtime_path = '/Users/yuki/.cache/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/Users/yuki/.cache/dein/.cache/init.vim'
let &runtimepath = '/Users/yuki/.config/nvim,/etc/xdg/nvim,/Users/yuki/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/Users/yuki/.cache/dein,/Users/yuki/.cache/dein/.cache/init.vim/.dein,/usr/local/Cellar/neovim/0.3.1/share/nvim/runtime,/Users/yuki/.cache/dein/.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Users/yuki/.local/share/nvim/site/after,/etc/xdg/nvim/after,/Users/yuki/.config/nvim/after,/Users/yuki/.cache/dein/repos/github.com/Shougo/dein.vim'
filetype off
