scriptencoding utf-8

source ~/vimrc/git_diffhistory.vim
source ~/vimrc/git_worktree.vim
source ~/vimrc/git_cycle_diffs.vim
source ~/vimrc/gitremotes.vim
source ~/vimrc/diffview.vim

" Fix GBrowse when over SSH; fix courtesy of Tim Pope: https://github.com/tpope/vim-rhubarb/issues/69#event-6633323753
if exists('$SSH_CONNECTION')
  command! -bar -nargs=* Browse echo "Link: " . <q-args>
endif

function! TabIsEmpty() abort
    " Remember which window we're in at the moment
    let initial_win_num = winnr()

    let win_count = 0
    " Add the length of the file name on to count:
    " this will be 0 if there is no file name
    windo let win_count += len(expand('%'))

    " Go back to the initial window
    exe initial_win_num . "wincmd w"

    " Check count
    if win_count == 0
        " Tab page is empty
        return 1
    else
        return 0
    endif
endfunction

function! WindowIsEmpty() abort
  if bufname("%") == ""
    if line('$') > 1
      return 0
    endif
    return len(getline('.')) == 0
  else
    return 0
  endif
endfunction

function! OpenFlog() abort
  let l:opencmd=''
  if WindowIsEmpty()
    let l:opencmd='-open-cmd=edit'
  endif
  call flogmenu#open_git_log(l:opencmd)
endfunction

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
  autocmd FileType floggraph nno <silent> <buffer> gb :<C-U>call flog#run_command("GBrowse %(h)")<CR>
  autocmd FileType floggraph nno <silent> <buffer> gd :<C-U>call flog#run_command('call CommitQF("%h")')<CR>

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

  autocmd FileType floggraph nno <buffer> <silent> <Leader>nc :Flogjump HEAD<CR>

  autocmd FileType floggraph nnoremap <buffer> <silent> <CR> :<C-U>call flog#run_tmp_command('vertical belowright Git show %h')<CR> <C-W>lG{j
augroup END

let g:flog_default_arguments = { 'date' : 'short' }

" Flog menu bindings
augroup flogmenu
  autocmd FileType floggraph nno <silent> <buffer> <Leader>m :<C-U>call flogmenu#open_main_contextmenu()<CR>
  autocmd FileType floggraph vno <silent> <buffer> <Leader>m :<C-U>call flogmenu#open_visual_contextmenu()<CR>
augroup END

let g:fugitive_conflict_x = 1


" Git log
nnoremap <silent> <leader>gll :call OpenFlog()<CR>
nnoremap <leader>glc :Flog<CR>
nnoremap <leader>gls :Flogsplit -all<CR>
nnoremap <leader>glv :vertical Flogsplit -all<CR>
" nnoremap <leader>glt :%Glog<CR>
" nnoremap <leader>glt :Glog -- %<bar>copen<CR>
nnoremap <leader>glt :Flog -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%<CR>
nnoremap <leader>glT :Git log --patch -- %<CR>
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
 \'T': 'File log graph',
 \'k': 'Vsplit file history',
 \'1-6': 'File ..* history',
 \'1': 'which_key_ignore',
 \'2': 'which_key_ignore',
 \'3': 'which_key_ignore',
 \'4': 'which_key_ignore',
 \'5': 'which_key_ignore',
 \'6': 'which_key_ignore',
 \}

fu! SystemGit(command) abort
  return substitute(execute('Git ' . a:command), '^.', '', '')
endfunction

fu! Get_tracking_branch(localbranch) abort
  let l:remote_tracking_branch = SystemGit('config branch.'.a:localbranch.'.merge')
  return l:remote_tracking_branch
endfunction

fu! Set_tracking_branch_if_missing() abort
  let l:branch = SystemGit('name-rev --name-only HEAD')
  let l:remote_tracking_branch = Get_tracking_branch(l:branch)
  if l:remote_tracking_branch ==# ''
    call SystemGit('branch --set-upstream-to origin/' . l:branch . ' ' . l:branch)
  endif
endfunction

fu! Track_and_pull() abort
  call Set_tracking_branch_if_missing()
  execute 'Git pull'
endfunction

" Git
nnoremap <leader>ga :call flogmenu#open_all_windows()<CR>
nnoremap <leader>gx :GBrowse<CR>
vnoremap <leader>gx :GBrowse<CR>
nnoremap <leader>gs :Git<CR>

nnoremap <leader>gS :SignifyReset<CR>
nnoremap <silent><leader>gp :SignifyOlder<CR>:sleep 200m<CR>:SignifyRefresh<CR>
nnoremap <leader>g[ :CompareOlder<CR>
nnoremap <leader>g] :CompareNewer<CR>

nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gR :Gread<CR>

nnoremap <leader>gj :Git fetch --all<CR>
nnoremap <leader>gJ :call Track_and_pull()<CR>
nnoremap <leader>gk :Git push<CR>
nnoremap <leader>gK :Git push --force-with-lease<CR>

" stashing
nnoremap <leader>gi :GStash<space>
nnoremap <leader>go :GStashList<CR>

" A more sane configuration
let g:fuzzy_stash_actions = {
  \ 'ctrl-d': 'drop',
  \ 'ctrl-o': 'pop',
  \ 'ctrl-a': 'apply' }

nnoremap <leader>gn :Gvdiffsplit!<CR>
nnoremap <leader>gz :Git blame<CR>
nnoremap <leader>gb :Twiggy<CR>
nmap <Leader>gm <Plug>(git-messenger)
nnoremap <leader>gB :GBranches<CR>
nnoremap <leader>gt :GTags<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gh :Git diff HEAD^<CR>
nnoremap <leader>g. :Git add .<CR>
nnoremap <leader>gg :Git add %<CR>
nnoremap <leader>gu :call flogmenu#open_unmerged()<CR>
nnoremap <silent><leader>gd :call CommitQF()<CR>:copen<CR>
nnoremap <leader>gD :Git add %:h<CR>
nnoremap <leader>g/ :GitGrep<CR>

let g:which_key_map['g'] = {'name': '+Git',
             \'a': 'All windows',
             \'s': 'Status',
             \'S': 'Signify reset',
             \'p': 'Signify parent',
             \'e': 'Toggle index / working file version',
             \'r': 'Remotes',
             \'R': 'Reset to index',
             \'j': 'Fetch',
             \'m': 'Blame line',
             \'J': 'Pull',
             \'k': 'Push',
             \'K': 'Push force (lease)',
             \'n': 'Diff file',
             \'z': 'Blame file',
             \'b': 'Branches',
             \'B': 'Branch search',
             \'t': 'Tags',
             \'i': 'Stash',
             \'o': 'View stashes',
             \'x': 'GBrowse',
             \'c': 'Commit',
             \'h': 'Show head',
             \'.': 'Add CWD',
             \'g': 'Add file',
             \'u': 'Open unmerged files',
             \'d': 'quickfix diff',
             \'D': 'Add file dir',
             \'l': g:git_log_menu,
             \'/': 'Search',
             \'w': g:git_worktree_menu,
             \}

augroup DirvishSignifyOverride
  autocmd FileType dirvish nmap <silent><buffer>]c <Plug>(dirvish_git_next_file)
  autocmd FileType dirvish nmap <silent><buffer>[c <Plug>(dirvish_git_prev_file)
augroup END

" Flog teamjump bindings https://github.com/TamaMcGlinn/flog-teamjump.vim
augroup flogteamjump
  autocmd FileType floggraph nno <silent> <buffer> ]] :<C-U>call flogteamjump#Choose_From_Teams()<CR>
  autocmd FileType floggraph nno <silent> <buffer> ]p :<C-U>call flogteamjump#Jump_To_Selected_Team(v:true)<CR>
  autocmd FileType floggraph nno <silent> <buffer> [p :<C-U>call flogteamjump#Jump_To_Selected_Team(v:false)<CR>
augroup END

let g:git_messenger_include_diff = 'current'

function! CommitQF(...)
    " Get the commit hash if it was specified
    let commit = a:0 == 0 ? 'HEAD^' : a:1

    " Get the result of git show in a list
    let flist = system(FugitiveShellCommand('diff') . ' --name-only ' . commit)
    let flist = split(flist, '\n')

    " Create the dictionaries used to populate the quickfix list
    let list = []
    for f in flist
        let l:real_filename = FugitiveWorkTree() . '/' . f
        let dic = {'filename': l:real_filename, 'lnum': 1}
        call add(list, dic)
    endfor

    " Populate the qf list
    call setqflist(list)
endfunction

" function! Flog_Git_Log() abort
"   let l:command = flog#get_fugitive_git_command()
"   let l:command .= ' log'
"   let l:command .= flog#build_log_args()
"   let l:command .= ' -- '
"   let l:command .= flog#build_log_paths()
"   return l:command
" endfunction
"
" let g:flog_build_log_command_fn = 'Flog_Git_Log'
