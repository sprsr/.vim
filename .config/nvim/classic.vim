set runtimepath^=~/.vim
let &packpath = &runtimepath
let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1

source ~/.vim/.vimrc
command PlugInstall :PlugInstall
