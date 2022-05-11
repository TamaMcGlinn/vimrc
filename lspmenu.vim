
nnoremap <leader>rr :execute 'ij '.expand('<cword>')<CR>
nnoremap <leader>ri :LspInfo<CR>
nnoremap <leader>rI :LspInstallInfo<CR>
nnoremap <leader>rq :LspStop<CR>
nnoremap <leader>rR :LspRestart<CR>
nnoremap <leader>rl :e ~/.cache/nvim/lsp.log<CR>

let g:which_key_map['r'] = {'name': '+Refactor',
      \'r': 'Vim includesearch',
      \'i': 'LspInfo',
      \'I': 'LspInstallInfo',
      \'q': 'LspStop',
      \'l': 'LSP log',
      \'R': 'LspRestart',
      \}

