fu! GetDirFromPrompt() abort
  let l:line=getline('.')
  if l:line =~ '^[^> ]*@[^> ]* MINGW.. '
    if has('win32') || has ('win64')
      " USER@DOMAIN MINGW64 ~/vimscripts/dein/repos/github.com/autozimu/LanguageClient-neovim_next (next)
      let home='/' .. $HOME[0] .. substitute($HOME[2:], '\', '/', 'g')
      let l:line=substitute(l:line, '\~', home, '')
    endif
    " USER@DOMAIN MINGW64 /c/code/with spaces
    " USER@DOMAIN MINGW64 /c/code/in_git (master)
    let l:dir=substitute(substitute(substitute(l:line, '.*MINGW.. /\(.\)', '\1:', ''), '(.*)$', '', ''), '/', '\', 'g')
  elseif l:line =~ '.:[^>]*>.*'
    " C:\Program Files\Neovim\bin>some user-input
    let l:dir=substitute(l:line, '>.*', '', '')
  elseif l:line =~ '^[^@> ]*@[^:>@ ]*:[^$]'
    " tama@tama-hp-laptop:~/code/adacore/libadalang$
    let l:dir=substitute(substitute(l:line, '$.*', '', ''), '^[^@> ]*@[^:>@ ]*:', '', '')
  else
    throw 'No pattern matches '.l:line
  endif
  return l:dir
endfunction

" Change directory to current line
fu! DirToCurrentLine() abort
  if &buftype ==# 'terminal'
    let l:dir=GetDirFromPrompt()
  else
    let l:dir=expand('%:p:h')
  endif
  exe 'cd '.l:dir
  echom 'cd '.l:dir
endfunction
