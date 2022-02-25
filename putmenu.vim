let g:which_key_map['p'] = {'name': '+Put&Python',
             \'m': 'messages',
             \'r': 'runtimepath',
             \'i': 'pip config',
             \}

nnoremap <silent> <leader>pm :put =execute('messages')<CR>
nnoremap <silent> <leader>pr :put =execute('set runtimepath?')<CR>
