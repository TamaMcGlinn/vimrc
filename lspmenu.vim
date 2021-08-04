
nnoremap <leader>rr :execute 'ij '.expand('<cword>')<CR>
nnoremap <leader>ri :LspInfo<CR>
nnoremap <leader>rR :LspRestart<CR>

let g:which_key_map['r'] = {'name': '+Refactor',
      \'r': 'Vim includesearch',
      \'i': 'LspInfo',
      \'R': 'LspRestart',
      \}

