" Column up / down from https://vi.stackexchange.com/a/213/18875
" nnoremap cd :let searchbak=@/<CR>/\%<C-R>=virtcol(".")<CR>v\S<CR>:nohl<CR>:let @/=searchbak<CR>
" nnoremap cu :let searchbak=@/<CR>?\%<C-R>=virtcol(".")<CR>v\S<CR>:nohl<CR>:let @/=searchbak<CR>
nnoremap cu :call search('\%' . virtcol('.') . 'v\S', 'bW')<CR>
nnoremap cd :call search('\%' . virtcol('.') . 'v\S', 'W')<CR>
