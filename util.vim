function! StartsWith(longer, shorter) abort
  return a:longer[0:len(a:shorter)-1] ==# a:shorter
endfunction

function! FileIsInDirectory(directory) abort
  let l:fname = expand('%:p')
  return StartsWith(l:fname, a:directory)
endfunction

function! FileDiffersFromGitHEAD() abort
  let l:buffername = expand('%')
  call system(FugitiveShellCommand("diff-index") .. " --quiet HEAD -- " .. l:buffername)
  return v:shell_error
endfunction

