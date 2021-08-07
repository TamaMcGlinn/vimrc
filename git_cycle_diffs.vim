" Copied from https://gist.github.com/mattboehm/9977950
" because it was mentioned in this fugitive issue:
" https://github.com/tpope/vim-fugitive/issues/132
" then rewrote it entirely because it doesn't do what I want

function! GitList(command) abort
  let l:output = systemlist(fugitive#repo().git_command() . ' ' . a:command)
  if v:shell_error
    echoerr join(l:output, "\n")
    throw g:flog_shell_error
  endif
  return l:output
endfunction

function! GetCurrentFilename() abort
  let l:git_root = system(fugitive#repo().git_command() . ' rev-parse --show-toplevel')
  let l:git_root = l:git_root[0:len(git_root)-2]
  let l:absolute_filename = expand('%:p')
  return l:git_root
endfunction

function! FindCurrentFile(list) abort
  return -1
endfunction

function! ClampIndex(index, list_size) abort
  if a:index < 0
    echom 'First unstaged file'
    return 0
  endif
  if a:index >= a:list_size
    echom 'Last unstaged file'
    return a:list_size - 1
  endif
  return a:index
endfunction

function! OtherUnstagedFile(offset) abort
  let l:unstaged_list = GitList('diff --name-only --diff-filter=U')
  let l:current_index = FindCurrentFile(l:unstaged_list)
  if l:current_index == -1
    let l:next_index = 0
    echom 'First unstaged file'
  else
    let l:next_index = ClampIndex(l:current_index + a:offset, len(l:unstaged_list))
  endif
  silent execute 'e ' . l:unstaged_list[l:next_index]
endfunction

function! NextUnstagedFile() abort
  call OtherUnstagedFile(1)
endfunction

function! PreviousUnstagedFile() abort
  call OtherUnstagedFile(-1)
endfunction

nnoremap <silent> ]X :call NextUnstagedFile()<CR>
nnoremap <silent> [X :call PreviousUnstagedFile()<CR>
