" Navigate
nnoremap <Leader>pp :MRU<CR>			                " Show files
nnoremap <Leader>oh :MundoToggle<CR>			        " Show file history
" Fly between buffers
nnoremap <Leader>of :ls<CR>:b<space>
nnoremap <Leader>om :<C-u>marks<CR>:normal! `

" Tab movement
nnoremap <Leader>tO :tabe<CR>
nnoremap <Leader>tQ :tabc<CR>
nnoremap <Leader>h :tabp<CR> " Previous tab
nnoremap <Leader>l :tabn<CR> " Next tab

" Buffer movement
nnoremap <Leader>to :tabnew<CR>
nnoremap <Leader>tq :bp <BAR> bd #<CR>
nnoremap <Leader>H :bprev<CR> " Previous buffer
nnoremap <Leader>L :bnext<CR> " Next buffer

" CD to git root
nnoremap <Leader>qg :Gcd<CR>

" Move windows to different tabs (to move entire tab, use :tabmove)
map <Leader>tm :call MoveToNextTab()<CR><C-w>H
map <Leader>tn :call MoveToPrevTab()<CR><C-w>H
