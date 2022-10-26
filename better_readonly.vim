augroup SudoWriteReadOnly
  autocmd FileChangedRO * set noreadonly | execute "autocmd BufWriteCmd <buffer> SudoWrite"
augroup END

