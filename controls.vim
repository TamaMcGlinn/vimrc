" Custom commands start with space
let mapleader = ' '
set timeoutlen=430

" Move thrice as fast
nnoremap <silent> <C-Y> 3<C-Y>
nnoremap <silent> <C-E> 3<C-E>

source ~/vimrc/cntrl_move.vim
source ~/vimrc/move_to_tab.vim
source ~/vimrc/navigate.vim
source ~/vimrc/google_test.vim
source ~/vimrc/bazel.vim

" open directory of current file
nnoremap - :e %:h<CR>

" reload document
nnoremap <Leader>r :e! %<CR>

" maximize 
nnoremap \ :MaximizerToggle<CR>

" Remove search highlight until next search
nnoremap <silent> <Leader>d :noh<CR>

source ~/vimrc/sessions.vim

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

" Build current file
fu! GetCompileCommand(file)
  let s:cc_db = json_decode(readfile('compile_commands.json'))
  let s:current_file = filter(s:cc_db, 'v:val.file=~".*".a:file')
  return s:current_file[0].command
endfunction

fu! Compile(file)
  let &makeprg = GetCompileCommand(a:file)
  silent execute 'make'
  silent execute 'copen'
endfunction

source ~/vimrc/terminal.vim
source ~/vimrc/dir_to_current_line.vim
source ~/vimrc/file_hotkeys.vim
" source ~/vimrc/vebugger_mappings.vim
source ~/vimrc/vimspector_mappings.vim
source ~/vimrc/open_file_in_top_buffer.vim
source ~/vimrc/currentfilename.vim
source ~/vimrc/sudowrite.vim
