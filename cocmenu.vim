
nnoremap <leader>rR :CocRestart<CR>
nnoremap <leader>rr :execute 'ij '.expand('<cword>')<CR>
nnoremap <leader>rq :CocDisable<CR>
nnoremap <leader>rn :call CocActionAsync("rename")<CR>
nnoremap <leader>rf :call CocActionAsync("formatSelected")<CR>
nnoremap <leader>ra :set operatorfunc=<SID>CodeActionFromSelected<CR>g@<CR>
nnoremap <leader>rc :call CocActionAsync("codeAction", "")<CR>
nnoremap <leader>re :call CocActionAsync("doQuickfix")<CR>
nnoremap <leader>rd :CocList diagnostics<CR>
nnoremap <leader>rE :CocList extensions<CR>
nnoremap <leader>rC :CocList commands<CR>
nnoremap <leader>rb :CocList outline<CR>
nnoremap <leader>rs :CocList -I symbols<CR>
nnoremap <leader>rj :CocNext<CR><CR>
nnoremap <leader>rk :CocPrev<CR><CR>
nnoremap <leader>rp :CocListResume<CR>
nnoremap <leader>rm :CocAction<CR>

let g:which_key_map['r'] = {'name': '+Refactor',
      \'r': 'Vim includesearch',
      \'R': 'Coc Restart',
      \'q': 'Coc Disable',
      \'n': 'Symbol rename',
      \'f': 'Format selected',
      \'a': 'codeAction to selected region',
      \'c': 'codeAction to buffer',
      \'e': 'Autofix current line',
      \'d': 'Show all diagnostics',
      \'E': 'Manage extensions',
      \'C': 'Show commands',
      \'b': 'Find symbol in buffer',
      \'s': 'Find symbol everywhere',
      \'j': 'Default action for next item',
      \'k': 'Default action for previous item',
      \'p': 'Resume latest coc list',
      \'m': 'Coc action menu',
      \}

