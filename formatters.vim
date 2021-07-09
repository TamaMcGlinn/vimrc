" sourced from ~/vimrc/intellisense.vim
source ~/private_vimrc/formatters.vim

function! ApplyCppFormatters() abort
  call call('codefmt#FormatBuffer', ['copyright'])
  if expand('%:e') ==# 'h'
    call call('codefmt#FormatBuffer', ['header_guards'])
  endif
  call call('codefmt#FormatBuffer', ['clang-format'])
endfunction

augroup autoformat
  autocmd!
  autocmd BufWritePost *.ad[sb] Autoformat | noautocmd write
  autocmd BufWritePre *.cpp,*.h,*.cu call ApplyCppFormatters()

  " defaults from https://github.com/google/vim-codefmt
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END
