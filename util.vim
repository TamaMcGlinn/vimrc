function! StartsWith(longer, shorter) abort
  return a:longer[0:len(a:shorter)-1] ==# a:shorter
endfunction

function! FileIsInDirectory(directory) abort
  let l:fname = expand('%:p')
  return StartsWith(l:fname, a:directory)
endfunction

function! FileDiffersFromGitHEAD() abort
  let l:buffername = expand('%')
  " untracked new file?
  let l:output = system(FugitiveShellCommand("ls-files") .. " --exclude-standard --others -- " .. l:buffername)
  if l:output != ""
    return 1
  endif
  call system(FugitiveShellCommand("diff-index") .. " --quiet HEAD -- " .. l:buffername)
  return v:shell_error
endfunction

