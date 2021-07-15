function! OpenGithub() abort
  let l:line = getline('.')
  if l:line =~ "^Plug '"
    let url = substitute(substitute(l:line, "^Plug '", 'https://github.com/', ''), "'$", '', '')
    call GXBrowse(l:url)
  else
    call GXBrowse(expand('<cWORD>'))
  endif
endfunction

nnoremap <silent><buffer> gx :call OpenGithub()<CR>
