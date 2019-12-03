" VeBugger mappings
let g:vebugger_leader='<Leader>g'
nnoremap <Leader>gs :VBGstartGDB 
nnoremap <Leader>gt :VBGtoggleTerminalBuffer<CR> 
nnoremap <silent> <Leader>gq :VBGkill<CR>
nnoremap <Leader>gr :VBGrawWrite run<CR>
nnoremap <Leader>gp :VBGstepOut<CR>
nnoremap <Leader>gn :VBGstepOver<CR>
nnoremap <Leader>gg :VBGtoggleBreakpointThisLine<CR>
nnoremap <Leader>gc :VBGcontinue<CR>
nnoremap <Leader>g* :VBGevalWordUnderCursor<CR>
nnoremap <Leader>ge :VBGeval 
nnoremap <Leader>gw :VBGrawWrite 
nnoremap <Leader>ga :VBGclearBreakpoints<CR>
let g:vebugger_view_source_cmd='edit'
