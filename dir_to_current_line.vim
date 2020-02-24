" Change directory to current line
fu! DirToCurrentLine()
  if &buftype ==# 'terminal'
    let line=getline('.')
    if line =~ '^[^> ]*@[^> ]* MINGW.. '
      " USER@DOMAIN MINGW64 /c/code/with spaces
      " USER@DOMAIN MINGW64 /c/code/in_git (master)
      let dir=substitute(substitute(substitute(line, '.*MINGW.. /\(.\)', '\1:', ''), '([^)]*)$', '', ''), '/', '\', 'g')
    elseif line =~ '.:[^>]*>.*'
      " C:\Program Files\Neovim\bin>some user-input
      let dir=substitute(line, '>.*', '', '')
    elseif line =~ '^[^@> ]*@[^:>@ ]*:[^$]'
      " tama@tama-hp-laptop:~/code/adacore/libadalang$
      let dir=substitute(substitute(line, '$$', '', ''), '^[^@> ]*@[^:>@ ]*:', '', '')
    else
      echoerr 'No pattern matches '.line
      return
    endif
  else
    let dir=expand('%:p:h')
  endif
  exe 'cd '.dir
  echom 'cd '.dir
endfunction
nnoremap <Leader>q :call DirToCurrentLine()<CR>
