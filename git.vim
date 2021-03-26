let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

let g:signify_sign_show_count = 1
let g:signify_sign_show_text = 1

augroup GitBuffers
  " Ensure that when we leave a git buffer by usual (:wq) which leave the buffer there
  " the buffer is still closed since editing it later wouldn't make sense
  autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete
augroup END

fu! FixupCommit(commit_hash) abort
  execute 'Git commit --fixup=' . a:commit_hash
endfunction

fu! AmendCommit(commit_hash) abort
  call FixupCommit(a:commit_hash)
  execute 'Git rebase --autosquash ' . a:commit_hash . '~1'
endfunction

augroup flog
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

  autocmd FileType floggraph nno <buffer> <silent> ]r :<C-U>call flog#next_ref()<CR>
  autocmd FileType floggraph nno <buffer> <silent> [r :<C-U>call flog#previous_ref()<CR>

  autocmd FileType floggraph nno <buffer> <silent> ]h :<C-U>call flog#jump_to_next_head()<CR>
  autocmd FileType floggraph nno <buffer> <silent> [h :<C-U>call flog#jump_to_previous_head()<CR>

  autocmd FileType floggraph nno <buffer> <silent> h :<C-U>call flog#jump_to_parent()<CR>
  autocmd FileType floggraph nno <buffer> <silent> j :<C-U>call flog#down()<CR>
  autocmd FileType floggraph nno <buffer> <silent> k :<C-U>call flog#up()<CR>
  autocmd FileType floggraph nno <buffer> <silent> l :<C-U>call flog#jump_to_child()<CR>

  autocmd FileType floggraph nno <buffer> <silent> <Leader>nc :Flogjump HEAD<CR>
augroup END

let g:flog_default_arguments = { 'date' : 'short' }

" Flog menu bindings
augroup flogmenu
  autocmd FileType floggraph nno <buffer> <Leader>m :<C-U>call flogmenu#open_main_contextmenu()<CR>
  autocmd FileType floggraph vno <buffer> <Leader>m :<C-U>call flogmenu#open_visual_contextmenu()<CR>
augroup END

function FlogBuildLog() abort
    let l:state = flog#get_state()

    if l:state.no_graph
        return flog#build_log_command()
    endif

    let l:command = 'export GIT_DIR='
    let l:command .= shellescape(flog#get_fugitive_git_dir())
    let l:command .= '; '

    let l:command .= 'forest --style=10'
    let l:command .= substitute(flog#build_log_args(), ' --graph', '', '')
    let l:command .= ' -- '
    let l:command .= flog#build_log_paths()

    return l:command
endfunction

let g:flog_build_log_command_fn = 'FlogBuildLog'

let g:fugitive_conflict_x = 1
