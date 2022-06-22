function! JumpToTSGrammarDefinition() abort
  let l:identifier = expand("<cword>")
  " echom "Searching for " . l:identifier
  let l:result = search("\\<" . l:identifier . ": *\\$", "s")
  if l:result != 0
    " Found it
    return
  endif
  call search("function *" . l:identifier, "s")
endfunction

if expand('%:t') ==# 'grammar.js'
  echom "Remapping gd for grammar.js"
  nnoremap <silent> <buffer> gd :call JumpToTSGrammarDefinition()<CR>
endif
