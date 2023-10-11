" Remove red highlighting of _ chars in .md files
autocmd BufRead *.md syn match markdownError "\w\@<=\w\@="

" from masukomi/vim-markdown-folding readme
set nocompatible
if has("autocmd")
  filetype plugin indent on
endif
