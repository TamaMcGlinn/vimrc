
nnoremap <leader>cl :call CompareFiles('l', 'h')<CR>
nnoremap <leader>ch :call CompareFiles('h', 'l')<CR>
nnoremap <leader>ck :call CompareFiles('k', 'j')<CR>
nnoremap <leader>cj :call CompareFiles('j', 'k')<CR>

" NB copied from vim-floggit-keybindings/plugin/terminal.vim
fu! Which_key_update(key, dictionary) abort
  if has_key(g:which_key_map, a:key)
    let prior_name = g:which_key_map[a:key]['name']
    let new_name = l:prior_name . '/' . a:dictionary['name'][1:]
    for [new_key, new_value] in items(a:dictionary)
      let g:which_key_map[a:key][new_key] = new_value
    endfor
    let g:which_key_map[a:key]['name'] = l:new_name
  else
    let g:which_key_map[a:key] = a:dictionary
  endif
  call which_key#register('<Space>', 'g:which_key_map')
endfunction

call Which_key_update('c', {'name': '+Compare',
      \'h': 'which_key_ignore',
      \'j': 'which_key_ignore',
      \'k': 'which_key_ignore',
      \'l': 'which_key_ignore',
      \'hjkl': 'compare'
   \})
