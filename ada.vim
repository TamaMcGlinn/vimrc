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

" use a with clause
nnoremap <Leader>au yyp0cwusekJ

augroup Terminal_fixmissing_mapping
  autocmd!
  autocmd TermOpen * nnoremap <Leader>am :call FixMissingWith()<CR>
augroup END

