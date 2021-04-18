" Change directory to current line
fu! DirToCurrentLine() abort
  if &buftype ==# 'terminal'
    let line=getline('.')
    if line =~ '^[^> ]*@[^> ]* MINGW.. '
      if has('win32') || has ('win64')
        " BC2SCF22@WBLC2SCF22S01 MINGW64 ~/vimscripts/dein/repos/github.com/autozimu/LanguageClient-neovim_next (next)
        let home='/' .. $HOME[0] .. substitute($HOME[2:], '\', '/', 'g')
        let line=substitute(line, '\~', home, '')
      endif
      " USER@DOMAIN MINGW64 /c/code/with spaces
      " USER@DOMAIN MINGW64 /c/code/in_git (master)
      let dir=substitute(substitute(substitute(line, '.*MINGW.. /\(.\)', '\1:', ''), '(.*)$', '', ''), '/', '\', 'g')
    elseif line =~ '.:[^>]*>.*'
      " C:\Program Files\Neovim\bin>some user-input
      let dir=substitute(line, '>.*', '', '')
    elseif line =~ '^[^@> ]*@[^:>@ ]*:[^$]'
      " tama@tama-hp-laptop:~/code/adacore/libadalang$
      let dir=substitute(substitute(line, '$.*', '', ''), '^[^@> ]*@[^:>@ ]*:', '', '')
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
