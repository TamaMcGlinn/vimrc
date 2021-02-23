nnoremap <Leader>gs :call vimspector#Launch()<CR>
nmap <Leader>gq <Plug>VimspectorStop
nnoremap <Leader>gQ :call vimspector#Reset()<CR>

nmap <Leader>gl <Plug>VimspectorStepInto
nmap <Leader>gj <Plug>VimspectorStepOver
nmap <Leader>gk <Plug>VimspectorStepOut

nmap <Leader>g<space> <Plug>VimspectorContinue
nmap <Leader>gh <Plug>VimspectorRunToCursor

nmap <Leader>gg <Plug>VimspectorToggleBreakpoint
nmap <Leader>gc <Plug>VimspectorToggleConditionalBreakpoint
nmap <Leader>gf <Plug>VimspectorAddFunctionBreakpoint

nnoremap <Leader>gd :call vimspector#ClearBreakpoints()<CR>

nnoremap <Leader>gp <Plug>VimspectorPause
nnoremap <Leader>gr <Plug>VimspectorRestart

nnoremap <Leader>g8 :call vimspector#Evaluate(expand('<cWORD>'))<CR>
nnoremap <Leader>ge :call vimspector#Evaluate(input("Eval> "))<CR>
vnoremap <Leader>ge :call vimspector#Evaluate(GetVisualSelection())<CR>

nnoremap <Leader>go :VimspectorShowOutput 

" Show breakpoints in the UI
augroup ZVimspectorCustomMappings
    autocmd!
    autocmd User VimspectorUICreated call ZVimspectorSetupUi()
augroup end
function! ZVimspectorSetupUi()
    call win_gotoid(g:vimspector_session_windows.output)
    set ft=asm
    vert rightb copen
    exec ":vert resize " . winwidth(g:vimspector_session_windows.output)/3
    nnoremenu <silent> WinBar.ListBreakpoints :call vimspector#ListBreakpoints()<CR>
    call vimspector#ListBreakpoints()
    call win_gotoid(g:vimspector_session_windows.code)
endfunction
