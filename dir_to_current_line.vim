
function! GetDirFromPrompt() abort
  let l:line=getline('.')
  if l:line =~? '^[^> ]*@[^> ]* MINGW.. '
    " USER@DOMAIN MINGW64 ~/vimscripts/dein/repos/github.com/autozimu/LanguageClient-neovim_next (next)
    let home='/' . $HOME[0] . substitute($HOME[2:], '\', '/', 'g')
    let l:line=substitute(l:line, '\~', home, '')
    " USER@DOMAIN MINGW64 /c/code/with spaces
    " USER@DOMAIN MINGW64 /c/code/in_git (master)
    let l:dir=substitute(substitute(substitute(l:line, '.*MINGW.. /\(.\)', '\1:', ''), '(.*)$', '', ''), '/', '\', 'g')
  elseif l:line =~# '.:[^>]*>.*'
    " C:\Program Files\Neovim\bin>some user-input
    let l:dir=substitute(l:line, '>.*', '', '')
  elseif l:line =~# '^\((.*) \)\?[^@> ]*@[^:>@ ]*:[^$]'
    " tama@tama-hp-laptop:~/code/adacore/libadalang$
    let l:line=substitute(l:line, '^(.*) ', '', '')
    let l:dir=substitute(substitute(l:line, '$.*', '', ''), '^[^@> ]*@[^:>@ ]*:', '', '')
  else
    throw 'No pattern matches '.l:line
  endif
  return l:dir
endfunction

function! GetDir() abort
  if &buftype ==# 'terminal'
    return GetDirFromPrompt()
  else
    return expand('%:p:h')
  endif
endfunction

" Change directory to current line
function! DirToCurrentLine() abort
  let l:dir = GetDir()
  execute 'cd '.l:dir
  echom 'cd '.l:dir
endfunction

function! JumpToTerminalBuffer() abort
  if &buftype ==# 'terminal'
    return
  endif
  let l:first_window_number = winnr()
  while v:true
    execute "wincmd W"
    if &buftype ==# 'terminal'
      return
    endif
    if winnr() == l:first_window_number
      break
    endif
  endwhile
  throw "Unable to find terminal window in current tab"
endfunction

function! TermDirToCwd() abort
  call JumpToTerminalBuffer()
  call feedkeys('acd ' . getcwd() . '')
endfunction

" Change directory of terminal to current line
function! TermDirToCurrentLine() abort
  let l:dir = GetDir()
  call JumpToTerminalBuffer()
  call feedkeys('acd ' . l:dir . '')
endfunction

