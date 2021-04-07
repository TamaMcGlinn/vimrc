let g:which_key_map = {}

" Custom commands start with space
let mapleader = ' '
set timeoutlen=380

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

call which_key#register('<Space>', "g:which_key_map")
