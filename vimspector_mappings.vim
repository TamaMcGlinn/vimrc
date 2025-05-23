" starting
nnoremap <leader>ds :call vimspector#Launch()<CR>
nnoremap <leader>dp :call vimspector#Pause()<CR>
nnoremap <leader>dq :call vimspector#Reset()<CR>
nnoremap <leader>dr :call vimspector#Restart()<CR>

" stepping
nnoremap <leader>dl :call vimspector#StepInto()<CR>
nnoremap <leader>dj :call vimspector#StepOver()<CR>
nnoremap <leader>dh :call vimspector#StepOut()<CR>
nnoremap <leader>d<space> :call vimspector#Continue()<CR>
nnoremap <leader>dg :call vimspector#RunToCursor()<CR>

" breaking
nnoremap <leader>db :call vimspector#ToggleBreakpoint()<CR>
nnoremap <leader>dc :call vimspector#ToggleAdvancedBreakpoint()<CR>
nnoremap <leader>df :call vimspector#AddFunctionBreakpoint()<CR>
nnoremap <leader>dd :call vimspector#ClearBreakpoints()<CR>

" evaluating
nnoremap <expr> <leader>d8 ":VimspectorEval " . expand("<cWORD>")
nnoremap <leader>de :call vimspector#Evaluate(input("Eval> ")<CR>
" for normal mode - the word under the cursor
nmap <Leader>dv <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>dv <Plug>VimspectorBalloonEval

" jumping
nnoremap <leader>dt :call win_gotoid(g:vimspector_session_windows.stack_trace)<CR>
nnoremap ]s :call vimspector#JumpToNextBreakpoint()<CR>
nnoremap [s :call vimspector#JumpToPreviousBreakpoint()<CR>

" windows
nnoremap <leader>dL :VimspectorToggleLog<CR>

let g:which_key_map['d'] = {'name': '+Debug',
             \'s': 'Start',
             \'q': 'Quit',
             \'l': 'Step Into',
             \'j': 'Step Over',
             \'k': 'Step Out',
             \' ': 'Continue',
             \'h': 'Run To Cursor',
             \'b': 'Toggle Breakpoint',
             \'c': 'Toggle Conditional Breakpoint',
             \'f': 'Function Breakpoint',
             \'p': 'Pause',
             \'L': 'Toggle log',
             \'r': 'Restart',
             \'d': 'ClearBreakpoints',
             \'8': 'Evaluate word',
             \'e': 'Evaluate',
             \'t': 'stacktrace',
             \'v': 'value display',
             \}

vnoremap <Leader>ge :call vimspector#Evaluate(GetVisualSelection())<CR>

" Show breakpoints in the UI
" pending https://github.com/puremourning/vimspector/issues/10
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

let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-go', 'CodeLLDB', 'vscode-cpptools', 'vscode-bash', 'vim-debug-adapter', 'lldb-vscode' ]

let g:vimspector_base_dir=expand('$HOME') .. '/vimrc/vimspector_home'
