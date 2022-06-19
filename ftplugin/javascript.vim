function! JumpToTSGrammarDefinition() abort
  let l:identifier = expand("<cword>")
  " echom "Searching for " . l:identifier
  call search("\\<" . l:identifier . ": *\\$", "s")
endfunction

if expand('%:t') ==# 'grammar.js'
  echom "Remapping gd for grammar.js"
  nnoremap <silent> <buffer> gd :call JumpToTSGrammarDefinition()<CR>
endif
