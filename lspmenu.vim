
nnoremap <leader>rr :execute 'ij '.expand('<cword>')<CR>
nnoremap <leader>ri :LspInfo<CR>
nnoremap <leader>rI :Mason<CR>
nnoremap <leader>rq :LspStop<CR>
nnoremap <leader>rR :LspRestart<CR>
nnoremap <leader>rl :e ~/.local/state/nvim/lsp.log<CR>

let g:which_key_map['r'] = {'name': '+Refactor',
      \'r': 'Vim includesearch',
      \'i': 'LspInfo',
      \'I': 'Mason',
      \'q': 'LspStop',
      \'l': 'LSP log',
      \'R': 'LspRestart',
      \}

