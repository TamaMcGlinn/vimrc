command! Slack :call slim#StartSlack()
" Move thrice as fast
nnoremap <silent> <C-Y> 3<C-Y>
nnoremap <silent> <C-E> 3<C-E>

" Map sideways for moving function arguments
nnoremap <silent> <a-h> :SidewaysLeft<CR>
nnoremap <silent> <a-l> :SidewaysRight<CR>

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

source ~/vimrc/google_test.vim

" maximize 
nnoremap \ :MaximizerToggle<CR>
nnoremap <leader>rs :GPRSelect<CR>

" // to search for visually selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

source ~/vimrc/build.vim
source ~/vimrc/compare.vim
source ~/vimrc/file_hotkeys.vim
source ~/vimrc/harpoon.vim
source ~/vimrc/putmenu.vim
" source ~/vimrc/vebugger_mappings.vim
source ~/vimrc/vimspector_mappings.vim
source ~/vimrc/currentfilename.vim
source ~/vimrc/ada_options.vim

" bindings moved from lspconfig because I want them even without langserver attached
nnoremap [d :lua vim.diagnostic.goto_prev()<CR>
nnoremap ]d :lua vim.diagnostic.goto_next()<CR>

" sneak
let g:sneak#label = 1

source ~/vimrc/search.vim
source ~/vimrc/killneighbour.vim
