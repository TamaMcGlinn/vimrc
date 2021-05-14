" Terminal settings
" cc for commandline, cs for split first, ce to exit
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
  nnoremap <Leader>ct :tabnew<CR>:term<CR>A
endif

augroup TerminalMappings
  autocmd!
  if has('win32')
    autocmd TermOpen * nnoremap <buffer> <C-E> aexit<CR>exit<CR>
    autocmd TermOpen * tnoremap <buffer> <C-E> exit<CR>exit<CR>
  else
    autocmd TermOpen * nnoremap <buffer> <C-E> aexit<CR>
    autocmd TermOpen * tnoremap <buffer> <C-E> exit<CR>
  endif
augroup END

let g:which_key_map['c'] = {'name': '+Terminal',
             \'c': 'Full window',
             \'s': 'Split below',
             \'t': 'Tab',
             \'d': 'DOS CMD',
             \}
