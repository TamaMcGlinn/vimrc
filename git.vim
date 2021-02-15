let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

let g:signify_sign_show_count = 1
let g:signify_sign_show_text = 1

" These mappings work together, so you indicate the direction
nnoremap <Leader>nn :Gvdiffsplit!<CR>
nnoremap <Leader>nnh :Gdiffsplit!<CR>
" a is the buffer on the left, f is on the right
nnoremap <Leader>na :diffget //3<CR>
nnoremap <Leader>nf :diffget //2<CR>
" x is the buffer on the bottom, w is on the top
nnoremap <Leader>nx :diffget //3<CR>
nnoremap <Leader>nw :diffget //2<CR>

nnoremap <Leader>nr :Gedit<CR>

nnoremap <Leader>ns :Gstatus<CR>

nnoremap <Leader>np :Git push<CR>
nnoremap <Leader>nP :Git push --force-with-lease<CR>
nnoremap <Leader>nj :Git fetch --all<CR>
nnoremap <Leader>nJ :Git pull<CR>

nnoremap <Leader>nz :Git blame<CR>

" Gerrit
nnoremap <Leader>ngp :Git review<CR>

nnoremap <Leader>no :GCheckout<CR>

nnoremap <Leader>nc :Gcommit<CR>
nnoremap <Leader>ncb :call flog#run_command("Git bundle create " . input ("bundle> ") . " --branches --tags")<CR>

nnoremap <Leader>n. :Git add .<CR>
nnoremap <Leader>n, :Git add %<CR>

nnoremap <Leader>nb :GBranches<CR>

nnoremap <Leader>nl :Flog -all<CR>:Flogjump HEAD<CR>
nnoremap <Leader>nls :Flogsplit -all<CR>:Flogjump HEAD<CR>
nnoremap <Leader>nlv :vertical Flogsplit -all<CR>:Flogjump HEAD<CR>

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

fu! FixupCommit(commit_hash) abort
  execute "Git commit --fixup=" . a:commit_hash
endfunction

fu! AmendCommit(commit_hash) abort
  call FixupCommit(a:commit_hash)
  execute "Git rebase --autosquash " . a:commit_hash . "~1"
endfunction

augroup flog
  autocmd FileType floggraph nno <buffer> <Leader>co :<C-U>call flog#run_command('Git checkout %l', 0, 1)<CR>

  autocmd FileType floggraph nno <buffer> <Leader>b :<C-U>call flog#run_command('Git checkout -b ' . input ("Branch: ") . ' %h', 0, 1)<CR>
  autocmd FileType floggraph nno <buffer> <Leader>B :<C-U>call flog#run_command('Git checkout -B ' . input ("Branch: ") . ' %h', 0, 1)<CR>

  autocmd FileType floggraph nno <buffer> D :<C-U>call flog#run_tmp_command('below Git diff HEAD %h')<CR>
  " diff arbitrary commits in the graph using visual selection
  " regular D assumes you want to diff upwards, with the newer commit at the top
  autocmd FileType floggraph vno <buffer> D :<C-U>call flog#run_tmp_command("below Git diff %(h'>) %(h'<)")<CR>
  " DD is diff-down so the diff will be the opposite; what was added/remove to
  " go from the top commit to the bottom commit?
  autocmd FileType floggraph vno <buffer> DD :<C-U>call flog#run_tmp_command("below Git diff %(h'<) %(h'>)")<CR>

  " Create partial bundle files
  autocmd FileType floggraph vno <buffer> cb :<C-U>call flog#run_command("Git bundle create " . input ("bundle> ") . " %(l'>)..%(l'<)")<CR>
  autocmd FileType floggraph nno <buffer> cb :<C-U>call flog#run_command("Git bundle create " . input ("bundle> ") . " %(h).. --branches --tags")<CR>

  " 'amend' a selected commit with whatever is staged
  " Convention: second letter as a capital means 'and also commit the result'
  autocmd FileType floggraph nno <buffer> ca :<C-U>call flog#run_command('call FixupCommit("%h")', 0, 1)<CR>
  autocmd FileType floggraph nno <buffer> cA :<C-U>call flog#run_command('call AmendCommit("%h")', 0, 1)<CR>

  " Cherry pick the commit
  autocmd FileType floggraph nno <buffer> ch :<C-U>call flog#run_command('Git cherry-pick %h --no-commit', 0, 1)<CR>
  autocmd FileType floggraph nno <buffer> cH :<C-U>call flog#run_command('Git cherry-pick %h', 0, 1)<CR>

  " Rebase onto the commit
  autocmd FileType floggraph nno <buffer> rr :<C-U>call flog#run_command('Git rebase --interactive %h', 0, 1)<CR>
  autocmd FileType floggraph nno <buffer> rR :<C-U>call flog#run_command('Git rebase %h', 0, 1)<CR>
  
  " Revert the commit
  autocmd FileType floggraph nno <buffer> cr :<C-U>call flog#run_command('Git revert %h --no-commit', 0, 1)<CR>
  autocmd FileType floggraph nno <buffer> cR :<C-U>call flog#run_command('Git revert %h', 0, 1)<CR>

  " Reset to the commit; capitalize to also reset the working directory
  autocmd FileType floggraph nno <buffer> cv :<C-U>call flog#run_command("Git reset --mixed %h", 0, 1)<CR>
  autocmd FileType floggraph nno <buffer> cV :<C-U>call flog#run_command("Git reset --hard %h", 0, 1)<CR>

  " cm : Merge
  autocmd FileType floggraph nno <buffer> cm :<C-U>call flog#run_command('Git merge %l --no-ff', 0, 1)<CR>

  autocmd FileType floggraph nno <buffer> <silent> ]r :<C-U>call flog#next_ref()<CR>
  autocmd FileType floggraph nno <buffer> <silent> [r :<C-U>call flog#previous_ref()<CR>

  autocmd FileType floggraph nno <buffer> <silent> ]h :<C-U>call flog#jump_to_next_head()<CR>
  autocmd FileType floggraph nno <buffer> <silent> [h :<C-U>call flog#jump_to_previous_head()<CR>

  autocmd FileType floggraph nno <buffer> <silent> h :<C-U>call flog#jump_to_parent()<CR>
  autocmd FileType floggraph nno <buffer> <silent> j :<C-U>call flog#down()<CR>
  autocmd FileType floggraph nno <buffer> <silent> k :<C-U>call flog#up()<CR>
  autocmd FileType floggraph nno <buffer> <silent> l :<C-U>call flog#jump_to_child()<CR>

  autocmd FileType floggraph nno <buffer> <silent> <Leader>nc :Flogjump HEAD<CR>

  " Overload the same keybinding as in normal mode on any buffer; 
  " it does the same but also updates the vim-flog graph afterwards
  autocmd FileType floggraph nno <buffer> <Leader>nj :<C-U>call flog#run_command('Git fetch --all', 0, 1)<CR>
augroup END

let g:flog_default_arguments = { 'date' : 'short' }

" Flog menu bindings
augroup flogmenu
  autocmd FileType floggraph nno <buffer> <Leader>n :<C-U>call flogmenu#open_main_contextmenu()<CR>
augroup END

