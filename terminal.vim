" cc for commandline, cs for split terminal below,
" windows only: cd for dos terminal, csd for split dos terminal below
if has('win32')
  " Note, you need to empty the file Git\etc\motd
  " to get rid of the 'Welcome to Git' message
  set shell=cmd.exe
  nnoremap <Leader>cc :call termhere#OpenTerminal()<CR>
  nnoremap <Leader>cd :call termhere#OpenDOSTerminal()<CR>
  nnoremap <Leader>csd :call termhere#OpenSplitDOSTerminal()<CR>
else
  nnoremap <Leader>cc :call termhere#OpenTerminal()<CR>
  nnoremap <Leader>cs :call termhere#OpenSplitTerminal()<CR>
endif

let g:which_key_map['c'] = {'name': '+Terminal',
             \'c': 'Full window',
             \'s': 'Split below',
             \'f': 'relative filename',
             \'F': 'absolute filename',
             \'d': 'DOS CMD',
             \}

nnoremap <Leader>cf :call termhere#UseRelativeFilenameInTermBelow('')<CR>
nnoremap <Leader>cF :call termhere#UseAbsoluteFilenameInTermBelow('')<CR>

