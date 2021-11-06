let g:which_key_map['p'] = {'name': '+Putmenu',
             \'m': 'messages',
             \}

nnoremap <silent> <leader>pm :put =execute('messages')<CR>
