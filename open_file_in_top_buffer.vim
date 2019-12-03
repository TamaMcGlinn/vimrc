" Open file at position from compiler error on the terminal
" e.g. foobar.adb:27:2: "X" not declared in "Y"
" results in opening foobar.adb in the top buffer (not the terminal), and issuing '27G2|'
" Default vim comes close with 'vt:<C-W>gf' - but:
" 1) including the [colon][linenumber] suffix does not work as intended in NeoVim
" 2) this does not include the column, 
" 3) you cannot reuse the top window.

fu! OpenfileInTopBuffer(selection)
  let elements=split(a:selection, ':')
  let elementlen=len(elements)
  let filename=elements[0]
  if elementlen > 1
    let line=elements[1]
    if elementlen > 2
      let column=elements[2]
    endif
  endif
  " switch to top buffer
  silent execute 'wincmd k'
  try
    " find the file 
    if elementlen > 1
      " keepjumps ensures the top of the file is not added to the jumplist
      silent execute 'keepjumps find ' . filename
    else
      silent execute 'find ' . filename
      return
    endif
    if elementlen >= 3
      " go to the indicated line and column
      silent execute 'normal! ' . line . 'G' . column . '|'
    else " elementlen == 2
      " go to the indicated line
      silent execute 'normal! ' . line . 'G'
    endif
  endtry
endfunction

function! GetVisualSelection()
  let reg = '"'
  let [save_reg, save_type] = [getreg(reg), getregtype(reg)]
  normal! gv""y
  let text = @"
  call setreg(reg, save_reg, save_type)
  return text
endfunction

augroup Terminal_gf_mapping
  autocmd!
  autocmd TermOpen * nnoremap <silent> <buffer> gf :call OpenfileInTopBuffer( expand('<cWORD>') )<CR>
augroup END

vnoremap <silent> gf :call OpenfileInTopBuffer( GetVisualSelection() )<CR>
