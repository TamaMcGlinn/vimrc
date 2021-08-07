" Terminal settings
" cc for commandline, cs for split first, cntrl-e to exit
tnoremap <ESC> <C-\><C-n>

if has('win32')
  " Note, you need to empty the file Git\etc\motd
  " to get rid of the 'Welcome to Git' message
  set shell=cmd.exe
  nnoremap <Leader>cc :term<CR>adoskey.cmd<CR>cmd.exe /c "C:\\Progra~1\Git\bin\bash.exe --login -i"<CR>clear<CR>
  nnoremap <Leader>cs :split<CR>:wincmd j<CR>:term<CR>adoskey.cmd<CR>cls<CR>cmd.exe /c "C:\\Progra~1\Git\bin\bash.exe --login -i"<CR>clear<CR>
  nnoremap <Leader>ct :tabnew<CR>:term<CR>adoskey.cmd<CR>cls<CR>cmd.exe /c "C:\\Progra~1\Git\bin\bash.exe --login -i"<CR>clear<CR>
  nnoremap <Leader>cd :term<CR>adoskey.cmd<CR>cls<CR>
  nnoremap <Leader>csd :split<CR>:wincmd j<CR>:term<CR>adoskey.cmd<CR>cls<CR>
  nnoremap <Leader>ctd :tabnew<CR>:term<CR>adoskey.cmd<CR>cls<CR>
else
  nnoremap <Leader>cc :term<CR>A
  nnoremap <Leader>cs :split<CR>:wincmd j<CR>:term<CR>A
  nnoremap ,t :split<CR>:term<CR>A
  nnoremap <Leader>ct :tabnew<CR>:term<CR>A
endif

if has('win32')
  augroup TerminalMappings
    autocmd!
      autocmd TermOpen * nnoremap <buffer> <C-D> aexit<CR>exit<CR>
      autocmd TermOpen * tnoremap <buffer> <C-D> exit<CR>exit<CR>
  augroup END
endif

let g:which_key_map['c'] = {'name': '+Terminal',
             \'c': 'Full window',
             \'s': 'Split below',
             \'f': 'relative filename',
             \'F': 'absolute filename',
             \'t': 'Tab',
             \'d': 'DOS CMD',
             \}

function! UseAbsoluteFilenameInTermBelow(prefix, ...) abort
 let l:postfix = get(a:, 1, '')
 let l:filename = expand('%:p')
 " switch to bottom terminal buffer
 silent execute 'wincmd j'
 call feedkeys('a' . a:prefix . l:filename . l:postfix . '\<CR>')
endfunction

function! UseRelativeFilenameInTermBelow(prefix, ...) abort
   let l:postfix = get(a:, 1, '')
   let l:filename = bufname('%')
   " switch to bottom terminal buffer
   silent execute 'wincmd j'
   call feedkeys('a' . a:prefix . l:filename . l:postfix . '\<CR>')
endfunction

nnoremap <Leader>cf :call UseRelativeFilenameInTermBelow('ls ')<CR>
nnoremap <Leader>cF :call UseAbsoluteFilenameInTermBelow('ls ')<CR>

