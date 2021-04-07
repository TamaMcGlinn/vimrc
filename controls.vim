" Move thrice as fast
nnoremap <silent> <C-Y> 3<C-Y>
nnoremap <silent> <C-E> 3<C-E>

source ~/vimrc/cntrl_move.vim
source ~/vimrc/google_test.vim

" open directory of current file
nnoremap - :Dirvish %:h<CR>

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

