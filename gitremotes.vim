let g:git_remotes_menu = {'name': '+Remotes',
 \'r': 'Show remotes',
 \'a': 'Add remote',
 \ }

" note trailing space after GRemoteAdd
nnoremap <leader>gra :GRemoteAdd 
nnoremap <leader>grr :GRemoteList<CR>

" Set my github username, so that when I cntrl-f to fork I don't have to type it in
let g:gitremote_username = 'TamaMcGlinn'
