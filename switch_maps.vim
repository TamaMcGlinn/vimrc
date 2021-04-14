
let g:switch_custom_definitions = [
      \ {
      \   '\(\k\+\)\.': '\1->',
      \   '\(\k\+\)->': '\1.',
      \ }
    \ ]

" something& this;
" this.extra = 0;

augroup switch_rebase
autocmd FileType gitrebase let b:switch_custom_definitions =
    \ [
    \   [ 'pick', 'reword', 'edit', 'squash', 'fixup', 'exec', 'drop' ]
    \ ]
augroup END
