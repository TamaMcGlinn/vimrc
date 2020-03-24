" VeBugger mappings
let g:vebugger_leader='<Leader>g'
" defaults are from vim-vebugger/plugin/vebugger.vim:
"	\'i':'VBGstepIn',
"	\'o':'VBGstepOver',
"	\'O':'VBGstepOut',
"	\'c':'VBGcontinue',
"	\'t':'VBGtoggleTerminalBuffer',
"	\'b':'VBGtoggleBreakpointThisLine',
"	\'B':'VBGclearBreakpoints',
"	\'e':'VBGevalWordUnderCursor',
"	\'E':'exe "VBGeval ".input("VBG-Eval> ")',
"	\'x':'exe "VBGexecute ".getline(".")',
"	\'X':'exe "VBGexecute ".input("VBG-Exec> ")',
"	\'R':'exe "VBGrawWrite ".input("VBG> ")'})

nnoremap <Leader>gs :VBGstartGDB 
nnoremap <Leader>gt :VBGtoggleTerminalBuffer<CR> 
nnoremap <silent> <Leader>gq :VBGkill<CR>
nnoremap <Leader>gr :VBGrawWrite run<CR>
nnoremap <Leader>gg :VBGtoggleBreakpointThisLine<CR>
nnoremap <Leader>gc :VBGcontinue<CR>
nnoremap <Leader>g8 :VBGevalWordUnderCursor<CR>
nnoremap <Leader>ge :VBGeval 
nnoremap <Leader>gw :VBGrawWrite 
nnoremap <Leader>ga :VBGclearBreakpoints<CR>
let g:vebugger_view_source_cmd='edit'

augroup VebuggerPrePostUserActions
  autocmd!

  function PrintActionName()
    let l:debugger = vebugger#getActiveDebugger()
    if has_key(l:debugger, 'lastUserAction')
      let l:lastUserAction = l:debugger.lastUserAction
      echom l:lastUserAction.action
      echom join(l:lastUserAction.args)
    else
      echom "No lastuserAction set"
    endif
  endfunction

  "autocmd User Vebugger_PreUserAction call PrintActionName()
  "autocmd User Vebugger_PostUserAction :echom "after"
augroup END

