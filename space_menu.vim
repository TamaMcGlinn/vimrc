let g:which_key_map = {}

" Custom commands start with space
let mapleader = ' '
set timeoutlen=300

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

call which_key#register('<Space>', "g:which_key_map")
