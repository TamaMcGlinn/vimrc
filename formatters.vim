let g:markdownfmt_command = 'markdownfmt'
let g:markdownfmt_autosave=1

" sourced from ~/vimrc/intellisense.vim
if filereadable(expand("~/private_vimrc/private.vim"))
  source ~/private_vimrc/formatters.vim
endif

source ~/vimrc/gnatpp_adaformat.vim

function! ApplyCustomFormatters() abort
  if exists('*PrivateFormatters')
    call PrivateFormatters()
  endif
  if expand('%:e') ==# 'lua'
    call ApplyLuaFormatters()
  endif
endfunction

call glaive#Install()
Glaive codefmt buildifier_lint_mode='fix' buildifier_warnings='-module-docstring,-function-docstring,-function-docstring-args,-function-docstring-header,-function-docstring-return,+unsorted-dict-items'

function! ApplyPythonFormatters() abort
  call codefmt#FormatBuffer('isort')
  call codefmt#FormatBuffer('black')
endfunction

function! ApplyLuaFormatters() abort
  execute 'Autoformat'
endfunction

augroup buffer_save_autoformatters
  autocmd!
  autocmd BufWritePre * call ApplyCustomFormatters()

  " defaults from https://github.com/google/vim-codefmt
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  " autocmd FileType python AutoFormatBuffer isort
  " autocmd FileType python AutoFormatBuffer black
  autocmd BufWritePre *.py call ApplyPythonFormatters()
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue,svelte AutoFormatBuffer prettier
augroup END
