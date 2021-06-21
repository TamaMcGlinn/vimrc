nnoremap <leader>ds :call vimspector#Launch()<CR>
nnoremap <leader>dq :call vimspector#Reset()<CR>
nnoremap <leader>dl :call vimspector#StepInto()<CR>
nnoremap <leader>dj :call vimspector#StepOver()<CR>
nnoremap <leader>dk :call vimspector#StepOut()<CR>
nnoremap <leader>d<space> :call vimspector#Continue()<CR>
nnoremap <leader>dh :call vimspector#RunToCursor()<CR>
nnoremap <leader>dg :call vimspector#ToggleBreakpoint()<CR>
nnoremap <leader>dc :call vimspector#ToggleConditionalBreakpoint()<CR>
nnoremap <leader>df :call vimspector#AddFunctionBreakpoint()<CR>
nnoremap <leader>dp :call vimspector#Pause()<CR>
nnoremap <leader>dr :call vimspector#Restart()<CR>
nnoremap <leader>dd :call vimspector#ClearBreakpoints()<CR>
nnoremap <leader>d8 :call vimspector#Evaluate(expand("<cWORD>")<CR>
nnoremap <leader>de :call vimspector#Evaluate(input("Eval> ")<CR>
nnoremap <leader>do :VimspectorShowOutput<CR>

let g:which_key_map['d'] = {'name': '+Debug',
             \'s': 'Start',
             \'q': 'Quit',
             \'l': 'Step Into',
             \'j': 'Step Over',
             \'k': 'Step Out',
             \' ': 'Continue',
             \'h': 'Run To Cursor',
             \'g': 'Toggle Breakpoint',
             \'c': 'Toggle Conditional Breakpoint',
             \'f': 'Function Breakpoint',
             \'p': 'Pause',
             \'r': 'Restart',
             \'d': 'ClearBreakpoints',
             \'8': 'Evaluate word',
             \'e': 'Evaluate',
             \'o': 'Show output',
             \}

vnoremap <Leader>ge :call vimspector#Evaluate(GetVisualSelection())<CR>

" Show breakpoints in the UI
augroup ZVimspectorCustomMappings
    autocmd!
    autocmd User VimspectorUICreated call ZVimspectorSetupUi()
augroup end
function! ZVimspectorSetupUi()
    call win_gotoid(g:vimspector_session_windows.output)
    set ft=asm
    vert rightb copen
    exec ':vert resize ' . winwidth(g:vimspector_session_windows.output)/3
    nnoremenu <silent> WinBar.ListBreakpoints :call vimspector#ListBreakpoints()<CR>
    call vimspector#ListBreakpoints()
    call win_gotoid(g:vimspector_session_windows.code)
endfunction
