
nnoremap <leader>rR :LspRestart<CR>
nnoremap <leader>rr :execute 'ij '.expand('<cword>')<CR>

let g:which_key_map['r'] = {'name': '+Refactor',
      \'r': 'Vim includesearch',
      \'R': 'Coc Restart',
      \}

