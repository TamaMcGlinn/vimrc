" Custom commands start with space
let mapleader = " "
set timeoutlen=430

" Move thrice as fast
nnoremap <silent> <C-Y> 3<C-Y>
nnoremap <silent> <C-E> 3<C-E>

source ~/vimrc/cntrl_move.vim
source ~/vimrc/navigate.vim

" reload document
nnoremap <Leader>r :e! %<CR>

" Remove search highlight until next search
nnoremap <silent> <Leader>d :noh<CR>

source ~/vimrc/sessions.vim

fu! OpenUnmerged()
  execute 'args ' . system("git ls-files --unmerged | cut -f2 | sort -u | sed -r 's/ /\\\\ /g' | paste -sd ' ' -")
endfunction
noremap <silent> <F7> :call OpenUnmerged()<CR>

fu! Make_In_File_Dir()
  execute 'sp'
  " switch to new buffer
  silent execute 'wincmd j'
  lcd %:p:h/..
  execute 'term make'
  execute 'cd' getcwd(-1)
  " switch back to top buffer
  silent execute 'wincmd k'
endfunction

" Makefile
nnoremap <Leader>ii :!make<CR>
nnoremap <Leader>is :call Make_In_File_Dir()<CR>
nnoremap <Leader>it :!make test<CR>
nnoremap <Leader>ic :!make clean<CR>
nnoremap <Leader>ir :!make regenerate_tests<CR>
nnoremap <Leader>ia :make<CR>:copen<CR>

source ~/vimrc/terminal.vim
source ~/vimrc/dir_to_current_line.vim
source ~/vimrc/file_hotkeys.vim
" source ~/vimrc/vebugger_mappings.vim
source ~/vimrc/vimspector_mappings.vim
source ~/vimrc/open_file_in_top_buffer.vim
source ~/vimrc/currentfilename.vim
source ~/vimrc/sudowrite.vim
