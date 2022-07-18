" fix for yankring message on startup 'target STRING not available'
let g:yankring_clipboard_monitor=0

set termguicolors
silent! colorscheme gruvbox
set background=dark

set runtimepath^=~/vimrc

" reload vimrc file on write
augroup reload_vimrc " {
	autocmd!
	autocmd bufwritepost *.vim source $MYVIMRC
augroup END " }

" this one has to happen early so that mappings are registered
source ~/vimrc/space_menu.vim
