
nnoremap <leader>fx :!chmod +x %<CR>
nnoremap <leader>fs :source %<CR>
nnoremap <leader>fr :e! %<CR>
nnoremap <leader>fD :call delete(expand('%')) \| bp \| bdelete! #<CR>

let g:which_key_map['f'] = {'name': '+File',
             \'x': 'Set executable',
             \'s': 'Source',
             \'r': 'Reload',
             \'D': 'Delete',
             \}
