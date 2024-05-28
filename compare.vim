let s:Opposite_dirs = {'l': 'h', 'h': 'l', 'k': 'j', 'j': 'k'}

function! CompareFiles(dir) abort
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
  execute 'wincmd ' . s:Opposite_dirs[a:dir]
endfunction

nnoremap <leader>cl :call CompareFiles('l')<CR>
nnoremap <leader>ch :call CompareFiles('h')<CR>
nnoremap <leader>ck :call CompareFiles('k')<CR>
nnoremap <leader>cj :call CompareFiles('j')<CR>

call floggit#update_whichkey('c', {'name': '+Compare',
      \'h': 'which_key_ignore',
      \'j': 'which_key_ignore',
      \'k': 'which_key_ignore',
      \'l': 'which_key_ignore',
      \'hjkl': 'compare'
   \})
