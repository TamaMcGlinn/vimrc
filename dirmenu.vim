
" Dir
nnoremap <leader>qq :call DirToCurrentLine()<CR>
nnoremap <leader>qg :Gcd<CR>
nnoremap <leader>qo :copen<CR>
nnoremap <leader>qc :cclose<CR>

let g:which_key_map['q'] = {'name': '+Dir/Quickfix',
             \'q': 'current file',
             \'g': 'git root',
             \'o': 'Quickfix open',
             \'c': 'Quickfix close',
             \}
