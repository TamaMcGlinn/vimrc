let g:which_key_map = {}

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

call which_key#register('<Space>', "g:which_key_map")
