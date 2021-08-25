
let g:BibleDelimiter = ' '

nnoremap <leader>kk y :call bible#insert_quote('', 'KJV')<CR>
nnoremap <leader>ks y :call bible#insert_quote('', 'DutSVV')<CR>

vnoremap <leader>kk y :call bible#insert_quote(@*, 'KJV')<CR>
vnoremap <leader>ks y :call bible#insert_quote(@*, 'DutSVV')<CR>

let g:which_key_map['k'] = {'name': '+Bible',
      \'k': 'KJV',
      \'s': 'SVV'
      \}
