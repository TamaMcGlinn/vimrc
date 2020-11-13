" Change these if you want
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

let g:signify_sign_show_count = 1
let g:signify_sign_show_text = 1

" Help like in SpaceVim
nnoremap <Leader>n :echom 'p : Push; s : Status; n : Diff; a/f : Select left/right; c : Commit; o : Checkout; . : Stage .; , : Stage file'<CR>

nnoremap <Leader>nn :Gvdiff<CR>

nnoremap <Leader>ns :Gstatus<CR>

" a is the buffer on the left, f is on the right
nnoremap <Leader>na :diffget //3<CR>
nnoremap <Leader>nf :diffget //2<CR>

nnoremap <Leader>np :Gpush<CR>
nnoremap <Leader>nP :Gpush --force-with-lease<CR>

nnoremap <Leader>no :GCheckout<CR>

nnoremap <Leader>nc :Gcommit<CR>

nnoremap <Leader>n. :Git add .<CR>
nnoremap <Leader>n, :Git add %<CR>

nnoremap <Leader>nb :GBranches<CR>

nnoremap <Leader>nl :Flog<CR>
nnoremap <Leader>nl :Flog<CR>

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

augroup flog
  autocmd FileType floggraph nno <buffer> D :<C-U>call flog#run_tmp_command('below Git diff HEAD %h')<CR>
  autocmd FileType floggraph vno <buffer> D :<C-U>call flog#run_tmp_command("below Git diff %(h'<) %(h'>)")<CR>

  autocmd FileType floggraph nno <buffer> cf :<C-U>call flog#run_command('Git commit -m "fixup! %h"', 0, 1)<CR>

  autocmd FileType floggraph nno <buffer> cv :<C-U>call flog#run_command("Git reset --mixed %h", 0, 1)<CR>
  autocmd FileType floggraph nno <buffer> cV :<C-U>call flog#run_command("Git reset --hard %h", 0, 1)<CR>
augroup END

let g:flog_default_arguments = { 'date' : 'short' }
