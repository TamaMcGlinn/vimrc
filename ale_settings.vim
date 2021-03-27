augroup autoformat
  autocmd!
  autocmd FileType c,cpp,bzl AutoFormatBuffer
  autocmd BufWritePost *.ad[sb] Autoformat
augroup END
