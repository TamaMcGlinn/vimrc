" Move thrice as fast
nnoremap <silent> <C-Y> 3<C-Y>
nnoremap <silent> <C-E> 3<C-E>

" Make Y behave like other capitals
nnoremap Y y$

" Keep centered when searching
nnoremap n nzzzv
nnoremap N Nzzzv

" C-I C-O also works whenever we moved more than 5 lines
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Move visual selection around, indenting properly
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

source ~/vimrc/cntrl_move.vim
source ~/vimrc/google_test.vim

" open directory of current file / terminal line
nnoremap <silent> - :call browsedir#BrowseDir()<CR>

" maximize 
nnoremap \ :MaximizerToggle<CR>
nnoremap <leader>rs :GPRSelect<CR>

" double escape clears search
nno <esc><esc> :nohlsearch<cr>

" // to search for visually selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

source ~/vimrc/build.vim
source ~/vimrc/terminal.vim
source ~/vimrc/compare.vim
source ~/vimrc/file_hotkeys.vim
source ~/vimrc/harpoon.vim
source ~/vimrc/putmenu.vim
" source ~/vimrc/vebugger_mappings.vim
source ~/vimrc/vimspector_mappings.vim
source ~/vimrc/currentfilename.vim
source ~/vimrc/ada_options.vim

" Tab movement
nnoremap <Leader>h :tabp<CR>
nnoremap <Leader>l :tabn<CR>

let g:which_key_map['h'] = 'Previous tab'
let g:which_key_map['l'] = 'Next tab'

" sneak
let g:sneak#label = 1

source ~/vimrc/search.vim

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
