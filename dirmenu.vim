
" Dir
nnoremap <leader>qq :call dirhere#DirToCurrentLine()<CR>
nnoremap <leader>qw :call dirhere#TermDirToCwd()<CR>
nnoremap <silent> <leader>q- :cd -<CR>:pwd<CR>
nnoremap <leader>qc :call dirhere#TermDirToCurrentLine()<CR>
nnoremap <silent> <leader>qk :cd ..<CR>:pwd<CR>
nnoremap <silent> <leader>qg :call dirhere#CdToProjectRoot()<CR>
nnoremap <leader>qp :pwd<CR>

let g:lt_location_list_toggle_map = '<leader>qo'
let g:lt_quickfix_list_toggle_map = '<leader>ql'

let g:which_key_map['q'] = {'name': '+Dir/Quickfix',
             \'q': 'Current file',
             \'c': 'Terminal to here',
             \'-': 'Previous dir',
             \'w': 'Terminal to working dir',
             \'p': 'Print dir',
             \'k': 'Dir up',
             \'g': 'Git root',
             \'o': 'Location list',
             \'l': 'Quickfix list',
             \}
