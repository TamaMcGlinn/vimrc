call SourceIfReadable("$HOME/code/abe/vimrc/compile_menu.vim")

call SourceIfReadable("$HOME/code/abe/vimrc/file_menu.vim")

function! RunFile() abort
  let filename=expand('%:t')[:-5]
  execute '!./bin/' . l:filename
endfunction

" nnoremap <silent> <leader>if :call AbeCompile()<cr>
" nnoremap <silent> <leader>fe :call RunFile()<cr>
" nnoremap <silent> <leader>fn :call AbeNewFile()<cr>

command! -bang FindMinetestFile call fzf#vim#files('~/code/computercraft/minetest', <bang>0)
nnoremap <silent> <leader>fm :FindMinetestFile<CR>
