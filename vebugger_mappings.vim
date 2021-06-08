" VeBugger mappings
let g:vebugger_leader='<Leader>d'

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

nnoremap <silent> <buffer> <Leader>dt :VBGtoggleTerminalBuffer<CR> 

nnoremap <buffer> <Leader>ds :VBGstartGDB 
nnoremap <silent> <buffer> <Leader>dq :VBGkill<CR>

nnoremap <silent> <buffer> <Leader>dl :VBGstepIn
nnoremap <silent> <buffer> <Leader>dj :VBGstepOver
nnoremap <silent> <buffer> <Leader>dk :VBGstepOut
nnoremap <silent> <buffer> <Leader>d<space> :VBGcontinue<CR>

nnoremap <silent> <buffer> <Leader>dr :VBGrawWrite run<CR>
nnoremap <silent> <buffer> <Leader>dg :VBGtoggleBreakpointThisLine<CR>
nnoremap <silent> <buffer> <Leader>d8 :VBGevalWordUnderCursor<CR>
nnoremap <silent> <buffer> <Leader>de :VBGeval 
nnoremap <silent> <buffer> <Leader>dw :VBGrawWrite 
nnoremap <silent> <buffer> <Leader>dd :VBGclearBreakpoints<CR>

let g:vebugger_view_source_cmd='edit'

