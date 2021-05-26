
nnoremap <leader>cl :call CompareFiles('l', 'h')<CR>
nnoremap <leader>ch :call CompareFiles('h', 'l')<CR>
nnoremap <leader>ck :call CompareFiles('k', 'j')<CR>
nnoremap <leader>cj :call CompareFiles('j', 'k')<CR>

let g:which_key_map['c']['h'] = 'which_key_ignore'
let g:which_key_map['c']['j'] = 'which_key_ignore'
let g:which_key_map['c']['k'] = 'which_key_ignore'
let g:which_key_map['c']['l'] = 'which_key_ignore'
let g:which_key_map['c']['hjkl'] = 'compare'
