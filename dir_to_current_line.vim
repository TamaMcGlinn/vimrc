fu! GetDirFromPrompt() abort
  let l:line=getline('.')
  if l:line =~ '^[^> ]*@[^> ]* MINGW.. '
    " USER@DOMAIN MINGW64 ~/vimscripts/dein/repos/github.com/autozimu/LanguageClient-neovim_next (next)
    let home='/' .. $HOME[0] .. substitute($HOME[2:], '\', '/', 'g')
    let l:line=substitute(l:line, '\~', home, '')
    " USER@DOMAIN MINGW64 /c/code/with spaces
    " USER@DOMAIN MINGW64 /c/code/in_git (master)
    let l:dir=substitute(substitute(substitute(l:line, '.*MINGW.. /\(.\)', '\1:', ''), '(.*)$', '', ''), '/', '\', 'g')
  elseif l:line =~ '.:[^>]*>.*'
    " C:\Program Files\Neovim\bin>some user-input
    let l:dir=substitute(l:line, '>.*', '', '')
  elseif l:line =~ '^\((.*) \)\?[^@> ]*@[^:>@ ]*:[^$]'
    " tama@tama-hp-laptop:~/code/adacore/libadalang$
    let l:line=substitute(l:line, '^(.*) ', '', '')
    let l:dir=substitute(substitute(l:line, '$.*', '', ''), '^[^@> ]*@[^:>@ ]*:', '', '')
  else
    throw 'No pattern matches '.l:line
  endif
  return l:dir
endfunction

fu! GetDir() abort
  if &buftype ==# 'terminal'
    return GetDirFromPrompt()
  else
    return expand('%:p:h')
  endif
endfunction

" Change directory to current line
fu! DirToCurrentLine() abort
  let l:dir = GetDir()
  execute 'cd '.l:dir
  echom 'cd '.l:dir
endfunction

" Change directory of terminal to current line
fu! TermDirToCurrentLine() abort
  let l:dir = GetDir()
  if &buftype !=# 'terminal'
    wincmd j
  endif
  call feedkeys('acd ' . l:dir . '')
endfunction

