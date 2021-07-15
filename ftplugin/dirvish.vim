" unmap all default mappings
let g:dirvish_dovish_map_keys = 0

" unmap dirvish default
unmap <buffer> p

" Your preferred mappings
nmap <silent><buffer> i <Plug>(dovish_create_file)
nmap <silent><buffer> I <Plug>(dovish_create_directory)
nmap <silent><buffer> dd <Plug>(dovish_delete)
nmap <silent><buffer> r <Plug>(dovish_rename)
nmap <silent><buffer> yy <Plug>(dovish_yank)
xmap <silent><buffer> yy <Plug>(dovish_yank)
nmap <silent><buffer> p <Plug>(dovish_copy)
nmap <silent><buffer> P <Plug>(dovish_move)

" git Cntrl-N next Cntrl-P previous file
nmap <silent><buffer><C-n> <Plug>(dirvish_git_next_file)
nmap <silent><buffer><C-p> <Plug>(dirvish_git_prev_file)

" nnn compatibility
nmap <silent><buffer> l <CR>
nmap <silent><buffer> h -
