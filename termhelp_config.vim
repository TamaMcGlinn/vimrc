" Note that the terminal filetype doesn't work by default without using
" termhere, because Justin thinks the empty string is a more sensible default
" for terminal buffers. See:
" https://github.com/neovim/neovim/issues/4465
augroup termhelp
    autocmd FileType terminal nnoremap <buffer> <Leader>n :TermHelp 
    autocmd FileType terminal vnoremap <buffer> <Leader>n :Chat terminal_correction
    autocmd FileType terminal vnoremap <buffer> <Leader>nn :Chat terminal_correction<CR>
augroup END

let g:termhelp_learn_to_stop_worrying = v:false
