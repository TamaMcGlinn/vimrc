let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_fixers = {
\   'cpp': ['clangtidy']
\}

augroup autoformat
  autocmd!
  autocmd FileType c,cpp,bzl AutoFormatBuffer
  autocmd BufWritePost *.ad[sb] Autoformat
augroup END
