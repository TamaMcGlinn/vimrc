
function! CloseOthers() abort
  let l:current_window = win_getid()
  let l:container = {}
  function container.myfunc() closure
    if &filetype ==# 'minimap'
      return
    endif
    if win_getid() == l:current_window
      return
    endif
    " echo "Would close " . winnr()
    close
  endfunction
  windo call container.myfunc()
  call win_gotoid(l:current_window)
endfunction

nnoremap <silent> <C-W>o :call CloseOthers()<CR>
