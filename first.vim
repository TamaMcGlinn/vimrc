" fix for yankring message on startup 'target STRING not available'
let g:yankring_clipboard_monitor=0

set termguicolors
silent! colorscheme gruvbox
set background=dark

set runtimepath^=~/vimrc

augroup reload_vimrc " {
	autocmd!
  " reload vim file on write
	autocmd bufwritepost *.vim source %
	" require lua file on write
	" autocmd bufwritepost *.lua luafile %
augroup END " }

" this one has to happen early so that mappings are registered
source ~/vimrc/space_menu.vim
