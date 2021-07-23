set shortmess+=c
set completeopt-=preview
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_auto_hover = ''
let g:ycm_key_detailed_diagnostics = ''

nnoremap ,] :YcmCompleter GoTo<cr>
nnoremap gd :YcmCompleter GoTo<cr>

nnoremap ,yt :YcmCompleter GetType<cr>
nnoremap ,ye :YcmShowDetailedDiagnostic<cr>
nnoremap ,yh :YcmCompleter GetDoc<cr>
nnoremap ,yf :YcmCompleter FixIt<cr>:ccl<cr>
nnoremap ,yd :YcmDiags<cr>
nnoremap ,yp <plug>(YCMHover)
nnoremap ,yr :YcmCompleter GoToReferences<cr>
