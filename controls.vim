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

" open in file explorer
nnoremap <leader>fo :call system("xdg-open " .. expand('%'))<CR>

source ~/vimrc/google_test.vim

" maximize 
nnoremap \ :MaximizerToggle<CR>
nnoremap <leader>rs :GPRSelect<CR>
nnoremap <leader>rS :GPRSelectFuzzy<CR>

" // to search for visually selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

source ~/vimrc/build.vim
source ~/vimrc/compare.vim
source ~/vimrc/file_hotkeys.vim
source ~/vimrc/harpoon.vim
source ~/vimrc/termcontrols.vim
source ~/vimrc/putmenu.vim
" source ~/vimrc/vebugger_mappings.vim
source ~/vimrc/vimspector_mappings.vim
source ~/vimrc/currentfilename.vim
source ~/vimrc/ada_options.vim
lua require("yank_and_paste")

lua require("alire_tools")
nnoremap <leader>ap :AlirePublish<CR>
nnoremap <leader>aP :AlirePublish!<CR>

nnoremap [d :lua vim.diagnostic.goto_prev()<CR>
nnoremap ]d :lua vim.diagnostic.goto_next()<CR>

nnoremap ]D :lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>
nnoremap [D :lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>

lua require('leap')
lua <<EOF
vim.keymap.set({'n', 'x', 'o'}, 's',  '<Plug>(leap-forward)')
vim.keymap.set({'n', 'x', 'o'}, 'S',  '<Plug>(leap-backward)')
-- vim.keymap.set({'n', 'x', 'o'}, 'gs', '<Plug>(leap-from-window)')
EOF

source ~/vimrc/search.vim
source ~/vimrc/killneighbour.vim
source ~/vimrc/close_others.vim
source ~/vimrc/voice_control.vim

" noice messages
function! ClearStuff() abort
  if exists(':Noice')
    execute "Noice dismiss"
  endif
endfunction

augroup escesc
  " double escape clears search stuff
  au BufEnter * nnoremap <esc><esc> :call ClearStuff()<CR>
augroup END
