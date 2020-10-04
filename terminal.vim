" Terminal settings
" cc for commandline, cs for split first, ce to exit
:tnoremap <ESC> <C-\><C-n>
if has("win32")
  " Note, you need to empty the file Git\etc\motd
  " to get rid of the 'Welcome to Git' message
  set shell=cmd.exe
  nnoremap <Leader>cc :term<CR>adoskey.cmd<CR>cmd.exe /c "C:\\Progra~1\Git\bin\bash.exe --login -i"<CR>clear<CR>
  nnoremap <Leader>cs :sp<CR>:wincmd j<CR>:term<CR>adoskey.cmd<CR>cls<CR>cmd.exe /c "C:\\Progra~1\Git\bin\bash.exe --login -i"<CR>clear<CR>
  nnoremap <Leader>cd :term<CR>adoskey.cmd<CR>cls<CR>
  nnoremap <Leader>csd :sp<CR>:wincmd j<CR>:term<CR>adoskey.cmd<CR>cls<CR>
else
  nnoremap <Leader>cc :term<CR>A
  nnoremap <Leader>cs :sp<CR>:wincmd j<CR>:term<CR>A
endif

augroup TerminalMappings
  autocmd!
  if has("win32")
    autocmd TermOpen * nnoremap <buffer> <C-E> aexit<CR>exit<CR>
    autocmd TermOpen * tnoremap <buffer> <C-E> exit<CR>exit<CR>
  else
    autocmd TermOpen * nnoremap <buffer> <C-E> aexit<CR>
    autocmd TermOpen * tnoremap <buffer> <C-E> exit<CR>
  endif
augroup END

" Make the split bigger
nnoremap <Leader>b 8<C-W>+<CR>
nnoremap <Leader>B 50<C-W>+<CR>
" Make the split wider
nnoremap <Leader>w 8<C-W>><CR>
nnoremap <Leader>W 56<C-W>><CR>

" Quit and return the current window to the previous buffer we were on
nnoremap <Leader>qp :w <bar> bp <bar> bd#<CR>
" Ensure that when we leave a git buffer by usual (:wq) which leave the buffer there
" the buffer is still closed since editing it later wouldn't make sense
autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete
