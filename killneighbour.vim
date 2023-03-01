function! KillNeighbour(motion)
  let l:curwin = win_getid()
  execute "normal! \<c-w>" .. a:motion
  q
  call win_gotoid(l:curwin)
endfunction

nnoremap <silent> <leader>xj :call KillNeighbour('j')<CR>
nnoremap <silent> <leader>xk :call KillNeighbour('k')<CR>
nnoremap <silent> <leader>xl :call KillNeighbour('l')<CR>
nnoremap <silent> <leader>xh :call KillNeighbour('h')<CR>
