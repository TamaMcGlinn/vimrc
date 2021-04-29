scriptencoding utf-8
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
" unlet g:flog_build_log_command_fn

let g:fugitive_conflict_x = 1


" Git log
nnoremap <leader>gll :call flogmenu#open_git_log()<CR>
nnoremap <leader>glc :Flog<CR>
nnoremap <leader>gls :Flogsplit -all<CR>
nnoremap <leader>glv :vertical Flogsplit -all<CR>
nnoremap <leader>glt :Flog -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%<CR>
nnoremap <leader>glk :vertical Flogsplit -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%<CR>
nnoremap <leader>gl1 :Flog -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%:h<CR>
nnoremap <leader>gl2 :Flog -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%:h:h<CR>
nnoremap <leader>gl3 :Flog -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%:h:h:h<CR>
nnoremap <leader>gl4 :Flog -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%:h:h:h:h<CR>
nnoremap <leader>gl5 :Flog -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%:h:h:h:h:h<CR>
nnoremap <leader>gl6 :Flog -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%:h:h:h:h:h:h<CR>

let g:git_log_menu = {'name': '+Log',
 \'l': 'Show git log',
 \'c': 'Current branch',
 \'s': 'Split',
 \'v': 'Vertical split',
 \'t': 'File history',
 \'k': 'Vsplit file history',
 \'1-6': 'File ..* history',
 \'1': 'which_key_ignore',
 \'2': 'which_key_ignore',
 \'3': 'which_key_ignore',
 \'4': 'which_key_ignore',
 \'5': 'which_key_ignore',
 \'6': 'which_key_ignore',
 \}

" TODO make these really work
" let g:flogmenu_stashmenu = {'name': 'Git stash menu',
"               \'h': [':Git -p stash show -p stash', 'Show'],
"               \'l': [':Git -p stash list',          'List'],
"               \'a': [':Git stash apply stash@{',    'Apply'],
"               \'p': [':Git stash pop',              'Pop'],
"               \'s': [':Git stash push<space>',      'Stash'],
"               \}

" Git
nnoremap <leader>ga :call flogmenu#open_all_windows()<CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gS :SignifyReset<CR>
nnoremap <leader>g[ :SignifyOlder<CR>
nnoremap <leader>g] :SignifyNewer<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gR :Gread<CR>
nnoremap <leader>gj :Git fetch --all<CR>
nnoremap <leader>gJ :Git pull<CR>
nnoremap <leader>gk :Git push<CR>
nnoremap <leader>gK :Git push --force-with-lease<CR>
nnoremap <leader>gn :Gvdiffsplit!<CR>
nnoremap <leader>gz :Git blame<CR>
nnoremap <leader>gb :Twiggy<CR>
nnoremap <leader>gB :GBranches<CR>
nnoremap <leader>gt :GTags<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>g. :Git add .<CR>
nnoremap <leader>gg :Git add %<CR>
nnoremap <leader>gu :call flogmenu#open_unmerged()<CR>
nnoremap <leader>gd :Git add %:h<CR>
nnoremap <leader>g/ :GitGrep<CR>

function Create_Worktree() abort
  let l:worktree_name = input('> ')
  " Doesn't work yet
  call nvim_execute_lua('require("git-worktree").create_worktree(l:worktree_name, l:worktree_name)', {})
endfunction

nnoremap <leader>gwa :call Create_Worktree()<CR>

let g:git_worktree_menu = {'name': '+Worktree',
 \'a': 'Add',
 \'s': 'Switch',
 \'d': 'Delete',
 \}

let g:which_key_map['g'] = {'name': '+Git',
             \'a': 'All windows',
             \'s': 'Status',
             \'S': 'Signify reset',
             \'h': 'Stash',
             \'e': 'Toggle index / working file version',
             \'R': 'Reset to index',
             \'j': 'Fetch',
             \'J': 'Pull',
             \'k': 'Push',
             \'K': 'Push force (lease)',
             \'n': 'Diff file',
             \'z': 'Blame file',
             \'b': 'Branches',
             \'B': 'Branch search',
             \'t': 'Tags',
             \'c': 'Commit',
             \'.': 'Add CWD',
             \'g': 'Add file',
             \'u': 'Open unmerged files',
             \'d': 'Add file dir',
             \'l': g:git_log_menu,
             \'/': 'Search',
             \'w': g:git_worktree_menu,
             \}

