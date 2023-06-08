" Fold using treesitter syntax
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

augroup UnfoldOnOpen
  autocmd BufReadPost,FileReadPost * normal zR
augroup END
