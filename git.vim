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

nnoremap <Leader>np :Git push<CR>
nnoremap <Leader>nP :Git push --force-with-lease<CR>
nnoremap <Leader>nj :Git fetch<CR>
nnoremap <Leader>nJ :Git pull<CR>

nnoremap <Leader>no :GCheckout<CR>

nnoremap <Leader>nc :Gcommit<CR>
nnoremap <Leader>ncb :call flog#run_command("Git bundle create " . input ("bundle> ") . " --branches --tags")<CR>

nnoremap <Leader>n. :Git add .<CR>
nnoremap <Leader>n, :Git add %<CR>

nnoremap <Leader>nb :GBranches<CR>

nnoremap <Leader>nl :Flog -all<CR>

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

augroup flog
  autocmd FileType floggraph nno <buffer> b :<C-U>call flog#run_command('Git branch -B ' . input ("Branch: ") . ' %h', 0, 1)<CR>

  autocmd FileType floggraph nno <buffer> D :<C-U>call flog#run_tmp_command('below Git diff HEAD %h')<CR>
  autocmd FileType floggraph vno <buffer> D :<C-U>call flog#run_tmp_command("below Git diff %(h'>) %(h'<)")<CR>
  autocmd FileType floggraph vno <buffer> DD :<C-U>call flog#run_tmp_command("below Git diff %(h'<) %(h'>)")<CR>

  autocmd FileType floggraph vno <buffer> cb :<C-U>call flog#run_command("Git bundle create " . input ("bundle> ") . " %(l'>)..%(l'<)")<CR>
  autocmd FileType floggraph nno <buffer> cb :<C-U>call flog#run_command("Git bundle create " . input ("bundle> ") . " %(h).. --branches --tags")<CR>

  autocmd FileType floggraph nno <buffer> cf :<C-U>call flog#run_command('Git commit -m "fixup! %h"', 0, 1)<CR>

  autocmd FileType floggraph nno <buffer> cv :<C-U>call flog#run_command("Git reset --mixed %h", 0, 1)<CR>
  autocmd FileType floggraph nno <buffer> cV :<C-U>call flog#run_command("Git reset --hard %h", 0, 1)<CR>

  autocmd FileType floggraph nno <buffer> cm :<C-U>call flog#run_command('Git merge %l --no-ff', 0, 1)<CR>

  autocmd FileType floggraph nno <buffer> <silent> ]r :<C-U>call flog#next_ref()<CR>
  autocmd FileType floggraph nno <buffer> <silent> [r :<C-U>call flog#previous_ref()<CR>

  autocmd FileType floggraph nno <buffer> <silent> ]h :<C-U>call flog#jump_to_next_head()<CR>
  autocmd FileType floggraph nno <buffer> <silent> [h :<C-U>call flog#jump_to_previous_head()<CR>
augroup END

let g:flog_default_arguments = { 'date' : 'short' }

" Move one level up with '..' when browsing tree or blob
autocmd User fugitive
  \ if get(b:, 'fugitive_type', '') =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

