nnoremap <silent> <leader>wo :Vvc<CR>
nnoremap <silent> <leader>wi :VvcInsert<CR>

call floggit#update_whichkey('w', {'name': '+Voice',
             \'o': 'Command',
             \'i': 'Insert',
             \})
