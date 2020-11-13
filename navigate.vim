" Navigate
nnoremap <Leader>pp :MRU<CR>			                " Show files
nnoremap <Leader>oh :MundoToggle<CR>			        " Show file history

" Tab movement
nnoremap <Leader>tO :tabe<CR>
nnoremap <Leader>tQ :tabc<CR>
nnoremap <Leader>h :tabp<CR> " Previous tab
nnoremap <Leader>l :tabn<CR> " Next tab

" Buffer movement
nnoremap <Leader>to :enew<CR>
nnoremap <Leader>tq :bp <BAR> bd #<CR>
nnoremap <Leader>H :bprev<CR> " Previous buffer
nnoremap <Leader>L :bnext<CR> " Next buffer

