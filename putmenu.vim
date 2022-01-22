let g:which_key_map['p'] = {'name': '+Putmenu',
             \'m': 'messages',
             \'r': 'runtimepath',
             \}

nnoremap <silent> <leader>pm :put =execute('messages')<CR>
nnoremap <silent> <leader>pr :put =execute('set runtimepath?')<CR>
