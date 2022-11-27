
nnoremap <leader>cl :call CompareFiles('l', 'h')<CR>
nnoremap <leader>ch :call CompareFiles('h', 'l')<CR>
nnoremap <leader>ck :call CompareFiles('k', 'j')<CR>
nnoremap <leader>cj :call CompareFiles('j', 'k')<CR>

call which_key#add_or_update('c', {'name': '+Compare',
      \'h': 'which_key_ignore',
      \'j': 'which_key_ignore',
      \'k': 'which_key_ignore',
      \'l': 'which_key_ignore',
      \'hjkl': 'compare'
   \})
