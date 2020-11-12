" Presentation mode for better readability on a beamer
syntax on
let g:presentationmode=0
fu! TogglePresentationMode()
  setlocal relativenumber!
  if g:presentationmode
    syntax on
    let g:presentationmode=0
  else
    syntax off
    let g:presentationmode=1
    highlight Normal ctermbg=white ctermfg=black
    highlight LineNr ctermbg=white ctermfg=black
  endif
endfunction

" nnoremap <Leader>pp :call TogglePresentationMode()<CR>
