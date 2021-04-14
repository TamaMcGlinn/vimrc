let debugMenu = {'name':           'Debug Menu',
             \'s': ['call vimspector#Launch()', 'Start'],
             \'q': ['execute \<Plug>VimspectorStop', 'Quit'],
             \'Q': ['call vimspector#Reset()', 'Reset'],
             \'l': ['call vimspector#StepInto()', 'Step Into'],
             \'j': ['call vimspector#StepOver()', 'Step Over'],
             \'k': ['call vimspector#StepOut()', 'Step Out'],
             \' ': ['call vimspector#Continue()', 'Continue'],
             \'h': ['call vimspector#RunToCursor()', 'Run To Cursor'],
             \'g': ['call vimspector#ToggleBreakpoint()', 'Toggle Breakpoint'],
             \'c': ['call vimspector#ToggleConditionalBreakpoint()', 'Toggle Conditional Breakpoint'],
             \'f': ['call vimspector#AddFunctionBreakpoint()', 'Function Breakpoint'],
             \'p': ['call vimspector#Pause()', 'Pause'],
             \'r': ['call vimspector#Restart()', 'Restart'],
             \'d': ['call vimspector#ClearBreakpoints()', 'ClearBreakpoints'],
             \'8': ['call vimspector#Evaluate(expand("<cWORD>")', 'Evaluate word'],
             \'e': ['call vimspector#Evaluate(input("Eval> ")', 'Evaluate'],
             \'o': ['VimspectorShowOutput', 'Show output'],
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
