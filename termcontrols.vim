function! JumpToPreviousMessage() abort
  call JumpToMsg(-1, '\(warning\|error\)')
endfunction

function! JumpToNextMessage() abort
  call JumpToMsg(1, '\(warning\|error\)')
endfunction

function! JumpToPreviousWarning() abort
  call JumpToMsg(-1, 'warning')
endfunction

function! JumpToNextWarning() abort
  call JumpToMsg(1, 'warning')
endfunction

function! JumpToPreviousError() abort
  call JumpToMsg(-1, 'error')
endfunction

function! JumpToNextError() abort
  call JumpToMsg(1, 'error')
endfunction

function! JumpToMsg(step, searchstring) abort
  let currentLine = line('.') + a:step
  let lastLine = line('$')
  while currentLine < lastLine
    " match with, for example:
    " some_file.adb:178:42: error: "Some_Var" is undefined (more references follow)
    if getline(currentLine) =~ '.*' . a:searchstring . '.*'
      execute 'normal! ' . currentLine . 'G'
      return
    endif
    let currentLine += a:step
  endwhile
  
endfunction

augroup TerminalControlMappings
  autocmd!
    autocmd TermOpen * nnoremap <buffer> ]E :call JumpToNextError()<CR>
    autocmd TermOpen * nnoremap <buffer> [E :call JumpToPreviousError()<CR>
    autocmd TermOpen * nnoremap <buffer> ]e :call JumpToNextMessage()<CR>
    autocmd TermOpen * nnoremap <buffer> [e :call JumpToPreviousMessage()<CR>
    autocmd TermOpen * nnoremap <buffer> ]w :call JumpToNextWarning()<CR>
    autocmd TermOpen * nnoremap <buffer> [w :call JumpToPreviousWarning()<CR>
augroup END
