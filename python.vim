
if has('win32')
  let g:python3_host_prog = 'C:\\Program\ Files\\Python36\\python.exe'
else
  let g:python3_host_prog = '/usr/bin/python3'
endif

nnoremap <silent> <leader>pi :e ~/.pip/pip.conf<CR>

