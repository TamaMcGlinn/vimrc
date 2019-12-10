" Custom commands start with space
let mapleader = " "
set timeoutlen=230

" Move thrice as fast
nnoremap <silent> <C-Y> 3<C-Y>
nnoremap <silent> <C-E> 3<C-E>

source ~\vimrc\cntrl_move.vim
source ~\vimrc\navigate.vim

" reload document
nnoremap <Leader>r :e! %<CR>

" Remove search highlight until next search
nnoremap <silent> <Leader>d :noh<CR>

source ~/vimrc/sessions.vim

fu! OpenUnmerged()
  execute 'args ' . system("git ls-files --unmerged | cut -f2 | sort -u | sed -r 's/ /\\\\ /g' | paste -sd ' ' -")
endfunction
noremap <silent> <F7> :call OpenUnmerged()<CR>

" CScope
if has("cscope")
  set csto=0
  set cst
  " CScope mappings
  noremap <Leader>ff :cs find 3 <C-R>=expand("<cword>")<CR><CR>
  noremap <Leader>fw :cs find 0 <C-R>=expand("<cword>")<CR><CR>
endif

" Makefile
nnoremap <Leader>ii :wincmd j<CR>amake<CR>
nnoremap <Leader>it :!make test<CR>
nnoremap <Leader>ic :!make clean<CR>
nnoremap <Leader>ir :!make regenerate_tests<CR>
nnoremap <Leader>ia :make<CR>:copen<CR>

source ~/vimrc/terminal.vim
source ~/vimrc/dir_to_current_line.vim
source ~/vimrc/file_hotkeys.vim
source ~/vimrc/vebugger_mappings.vim
source ~/vimrc/open_file_in_top_buffer.vim
source ~/vimrc/currentfilename.vim
