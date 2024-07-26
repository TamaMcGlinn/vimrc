" Start with Copilot off
augroup copilot_started
  autocmd!
  autocmd VimEnter * Copilot disable
augroup end

let g:which_key_map['n'] = {'name': '+LLM',
          \'e': 'enable Copilot',
          \'s': 'Copilot status',
          \'q': 'disable Copilot',
\}

nnoremap <silent> <leader>ne :Copilot enable<CR>
nnoremap <silent> <leader>ns :Copilot status<CR>
nnoremap <silent> <leader>nq :Copilot disable<CR>
