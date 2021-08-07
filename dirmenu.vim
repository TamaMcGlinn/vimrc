
" Dir
nnoremap <leader>qq :call DirToCurrentLine()<CR>
nnoremap <leader>qw :call TermDirToCwd()<CR>
nnoremap <leader>qc :call TermDirToCurrentLine()<CR>
nnoremap <leader>qg :Gcd<CR>
nnoremap <leader>qp :pwd<CR>

let g:lt_location_list_toggle_map = '<leader>qo'
let g:lt_quickfix_list_toggle_map = '<leader>ql'

let g:which_key_map['q'] = {'name': '+Dir/Quickfix',
             \'q': 'Current file',
             \'c': 'Terminal to here',
             \'w': 'Terminal to working dir',
             \'p': 'Print dir',
             \'g': 'Git root',
             \'o': 'Location list',
             \'l': 'Quickfix list',
             \}
