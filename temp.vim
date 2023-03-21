source $HOME/code/abe/vimrc/compile_menu.vim

nnoremap <silent> <c-b> :call AbeCompile()<cr>

function! RunFile() abort
  let filename=expand('%:t')[:-5]
  execute '!./bin/' . l:filename
endfunction

nnoremap <silent> <c-r> :call RunFile()<cr>
