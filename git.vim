" Change these if you want
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

" I find the numbers disctracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1

nnoremap <Leader>nn :Gvdiff<CR>

nnoremap <Leader>ns :Gstatus<CR>

" a is the buffer on the left, f is on the right
nnoremap <Leader>na :diffget //3<CR>
nnoremap <Leader>nf :diffget //2<CR>

nnoremap <Leader>np :Gpush<CR>

nnoremap <Leader>no :GCheckout<CR>

nnoremap <Leader>nc :Gcommit<CR>

nnoremap <Leader>n. :Git add .<CR>
nnoremap <Leader>n, :Git add %<CR>

nnoremap <Leader>nb :GBranches<CR>

nnoremap <Leader>nl :Flog<CR>

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

