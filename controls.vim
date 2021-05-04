" Move thrice as fast
nnoremap <silent> <C-Y> 3<C-Y>
nnoremap <silent> <C-E> 3<C-E>

source ~/vimrc/cntrl_move.vim
source ~/vimrc/google_test.vim

" open directory of current file
nnoremap - :e %:h<CR>

" maximize 
nnoremap \ :MaximizerToggle<CR>

" escape clears search
nno <esc><esc> :nohlsearch<cr>

source ~/vimrc/build.vim
source ~/vimrc/terminal.vim
source ~/vimrc/dir_to_current_line.vim
source ~/vimrc/file_hotkeys.vim
" source ~/vimrc/vebugger_mappings.vim
source ~/vimrc/vimspector_mappings.vim
source ~/vimrc/open_file_in_top_buffer.vim
source ~/vimrc/currentfilename.vim

" Tab movement
nnoremap <Leader>h :tabp<CR>
nnoremap <Leader>l :tabn<CR>

let g:which_key_map['h'] = 'Previous tab'
let g:which_key_map['l'] = 'Next tab'

" sneak
let g:sneak#label = 1

" With Ag
" nmap <Leader>/ <Plug>AgRawSearch
" vmap <Leader>/ <Plug>AgRawVisualSelection<CR>
" nmap <Leader>* <Plug>AgRawWordUnderCursor<CR>

" With CtrlSF
nmap <Leader>/ <Plug>CtrlSFPrompt
vmap <Leader>/ <Plug>CtrlSFVwordPath
nmap <Leader>8 <Plug>CtrlSFCCwordExec
nmap <Leader>* <Plug>CtrlSFCwordExec
let g:ctrlsf_confirm_save = 0

let g:which_key_map['/'] = 'Search'
let g:which_key_map['*'] = 'Search word'
let g:which_key_map['8'] = 'Search word'

" Make the split taller
nnoremap <Leader>bb 8<C-W>+<CR>
nnoremap <Leader>bB 24<C-W>+<CR>
" Make the split wider
nnoremap <Leader>bw 24<C-W>><CR>
nnoremap <Leader>bW 50<C-W>><CR>

let g:which_key_map['b'] = {'name': '+BiggerSplit',
             \'b': 'taller',
             \'B': 'much taller',
             \'w': 'wider',
             \'W': 'much wider',
             \}
