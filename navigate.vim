" Navigate
nnoremap <Leader>op :MRU<CR>			                " Show files
nnoremap <Leader>of :FZF<CR>			                " Find files
nnoremap <Leader>oh :GundoToggle<CR>			        " Show file history
"nnoremap <Leader>ot :TlistToggle<CR>			        " Show tags
nnoremap <Leader>oa :args src\/* \| tab sall<CR>  " Open src/*

" Tab movement
nnoremap <Leader>tO :tabe<CR>
nnoremap <Leader>tQ :tabc<CR>
nnoremap <Leader>H :bprev<CR> " Previous tab
nnoremap <Leader>L :bnext<CR> " Next tab

" Buffer movement
nnoremap <Leader>to :enew<CR>
nnoremap <Leader>tq :bp <BAR> bd #<CR>
nnoremap <Leader>h :bprev<CR> " Previous tab
nnoremap <Leader>l :bnext<CR> " Next tab

