
" Tabs
nnoremap <leader>to :tabnew<CR>
nnoremap <leader>tq :tabc<CR>
nnoremap <leader>tw :bp \| bd! #<CR>
nnoremap <leader>t, :call MoveToPrevTab()<CR>
nnoremap <leader>t. :call MoveToNextTab()<CR>
nnoremap <leader>th <CR>
nnoremap <leader>tl <CR>

let g:which_key_map['t'] = {'name': '+Tabs/Buffers',
             \'o': 'New tab',
             \'q': 'Close tab',
             \'w': 'Close and go back',
             \',': 'Move to previous tab',
             \'.': 'Move to next tab',
             \'h': 'Shift tab left',
             \'l': 'Shift tab right',
             \}
