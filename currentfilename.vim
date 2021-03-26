" Current filename options:

" vimrc.vim
nnoremap <Leader>aa "=expand("%:t")<CR>p
" C:\Users\bc2scf22\vimrc\vimrc.vim
nnoremap <Leader>af "=expand("%:p")<CR>p
" vimrc/vimrc.vim (if pwd is ~)
nnoremap <Leader>arf "=expand("%")<CR>p
" C:\Users\bc2scf22\vimrc
nnoremap <Leader>ad "=expand("%:p:h")<CR>p
" vimrc (if pwd is ~)
nnoremap <Leader>ard "=expand("%:h")<CR>p
" show full filename
nnoremap <Leader>as :echom expand("%:p")<CR>

let g:which_key_map['a'] = {'name': '+Filename',
             \'a': 'file',
             \'f': 'full path',
             \'rf': 'relative path',
             \'d': 'directory',
             \'rd': 'relative directory',
             \'s': 'show full path',
             \}
