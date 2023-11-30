function! CompareFiles(dir, reversedir) abort
  let l:cmd=""
  if &diff
    let l:cmd="diffoff"
  else
    let l:cmd="diffthis"
  endif
  execute l:cmd
  execute 'normal! zi'
  execute 'wincmd ' . a:dir
  execute l:cmd
  execute 'normal! zi'
  execute 'wincmd ' . a:reversedir
endfunction

nnoremap <leader>cl :call CompareFiles('l', 'h')<CR>
nnoremap <leader>ch :call CompareFiles('h', 'l')<CR>
nnoremap <leader>ck :call CompareFiles('k', 'j')<CR>
nnoremap <leader>cj :call CompareFiles('j', 'k')<CR>

call floggit#update_whichkey('c', {'name': '+Compare',
      \'h': 'which_key_ignore',
      \'j': 'which_key_ignore',
      \'k': 'which_key_ignore',
      \'l': 'which_key_ignore',
      \'hjkl': 'compare'
   \})
