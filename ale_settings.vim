let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_fixers = {
\   'cpp': ['clangtidy']
\}

augroup cpp_autoformat
  autocmd FileType c,cpp AutoFormatBuffer
augroup END
