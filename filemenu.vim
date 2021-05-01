
nnoremap <leader>fx :!chmod +x %<CR>
nnoremap <leader>fs :source %<CR>
nnoremap <leader>ff :CocCommand clangd.switchSourceHeader<CR>
nnoremap <leader>fS :SudoWrite<CR>
nnoremap <leader>fa :Startify<CR>
nnoremap <leader>fw :write<CR>
nnoremap <leader>fW :noautocmd write<CR>
nnoremap <leader>fr :e! %<CR>
nnoremap <leader>fD :call delete(expand('%')) \| bp \| bdelete! #<CR>

let g:which_key_map['f'] = {'name': '+File',
             \'x': 'Set executable',
             \'a': 'Startify',
             \'w': 'write',
             \'f': 'switch source / header',
             \'W': 'Noformat write',
             \'s': 'Source',
             \'S': 'SudoWrite',
             \'r': 'Reload',
             \'D': 'Delete',
             \}
