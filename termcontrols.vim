function! JumpToPreviousError() abort
  call JumpToError(-1)
endfunction

function! JumpToNextError() abort
  call JumpToError(1)
endfunction

function! JumpToError(step) abort
  let currentLine = line('.') + a:step
  let lastLine = line('$')
  while currentLine < lastLine
    " match with, for example:
    " some_file.adb:178:42: error: "Some_Var" is undefined (more references follow)
    if getline(currentLine) =~ '.*error.*'
      execute 'normal! ' . currentLine . 'G'
      return
    endif
    let currentLine += a:step
  endwhile
  
endfunction

augroup TerminalControlMappings
  autocmd!
    autocmd TermOpen * nnoremap <buffer> ]e :call JumpToNextError()<CR>
    autocmd TermOpen * nnoremap <buffer> [e :call JumpToPreviousError()<CR>
augroup END
