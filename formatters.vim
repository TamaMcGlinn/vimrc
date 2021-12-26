" sourced from ~/vimrc/intellisense.vim
source ~/private_vimrc/formatters.vim

function! ApplyCustomFormatters() abort
  call codefmt#FormatBuffer('copyright')
  if expand('%:e') ==# 'h'
    call call('codefmt#FormatBuffer', ['header_guards'])
  endif
  if expand('%:e') ==# 'cpp' || expand('%:e') ==# 'h' || expand('%:e') ==# 'cu'
    call codefmt#FormatBuffer('clang-format')
  endif
endfunction

function! ApplyPythonFormatters() abort
  call codefmt#FormatBuffer('black')
  call codefmt#FormatBuffer('isort')
endfunction


augroup autoformat
  autocmd!
  autocmd BufWrite *.ad[sb] :Autoformat
  autocmd BufWritePre * call ApplyCustomFormatters()

  " defaults from https://github.com/google/vim-codefmt
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  " autocmd FileType python AutoFormatBuffer isort
  " autocmd FileType python AutoFormatBuffer black
  autocmd BufWritePre *.py call ApplyPythonFormatters()
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END
