" Ada uses 3 spaces for indentation
autocmd Filetype ada setlocal expandtab tabstop=3 shiftwidth=3 softtabstop=3 signcolumn=yes
au BufRead,BufNewFile *.adb setlocal filetype=ada
au BufRead,BufNewFile *.ads setlocal filetype=ada

" Ada editing macros
fu! FixMissingWith()
  let line=getline('.') 
  let elements=split(line, '"')
  let missing=elements[1]..";"
  call OpenfileInTopBuffer(line)
  call append(0,missing)
  silent execute 'normal! gg'
endfunction

fu! UseWithStatement()
  let with_package = getline('.')
  let use_package=substitute(with_package, '^with ', ' use ', '')
  call setline(line('.'), with_package .. use_package)
endfunction

nnoremap <Leader>au :call UseWithStatement()<CR>

augroup Terminal_fixmissing_mapping
  autocmd!
  autocmd TermOpen * nnoremap <Leader>am :call FixMissingWith()<CR>
augroup END

