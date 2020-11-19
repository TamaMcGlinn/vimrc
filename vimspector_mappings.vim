packadd! vimspector

" Clear the existing WinBar created by Vimspector
nunmenu WinBar

nnoremap <Leader>gs :call vimspector#Launch()<CR>
nmap <Leader>gq <Plug>VimspectorStop
nnoremap <Leader>gQ :call vimspector#Reset()<CR>

nmap <Leader>gi <Plug>VimspectorStepInto
nmap <Leader>go <Plug>VimspectorStepOver
nmap <Leader>gO <Plug>VimspectorStepOut

nmap <Leader>gc <Plug>VimspectorContinue
nmap <Leader>gh <Plug>VimspectorRunToCursor

nmap <Leader>gg <Plug>VimspectorToggleBreakpoint
nmap <Leader>gk <Plug>VimspectorToggleConditionalBreakpoint
nmap <Leader>gf <Plug>VimspectorAddFunctionBreakpoint

nnoremap <Leader>gd :call vimspector#ClearBreakpoints()<CR>

nnoremap <Leader>gp :call <Plug>VimspectorPause
nnoremap <Leader>gr :call <Plug>VimspectorRestart

nnoremap <Leader>g8 :call vimspector#Evaluate(expand('<cWORD>'))<CR>
nnoremap <Leader>ge :call vimspector#Evaluate(input("Eval> "))<CR>
vnoremap <Leader>ge :call vimspector#Evaluate(GetVisualSelection())<CR>

nnoremap <Leader>gl :VimspectorShowOutput 
