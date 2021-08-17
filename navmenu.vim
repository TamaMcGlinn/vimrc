
nnoremap <leader>of :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>oa :NERDTreeToggle<CR>
nnoremap <leader>ot :Tags<CR>
nnoremap <leader>oG :Commits<CR>
nnoremap <leader>og :BCommits<CR>
nnoremap <leader>on :Lines<CR>
nnoremap <leader>oh :MundoToggle<CR>
nnoremap <leader>os :Rg<CR>
nnoremap <leader>o/ :BLines<CR>
nnoremap <leader>om :marks<CR>:normal! `<CR>
nnoremap <leader>o; :TagbarToggle<CR>
nnoremap <leader>oo :Buffers<CR>
nnoremap <leader>op :MRUToggle<CR>
nnoremap <leader>oP :FZFMru<CR>
nnoremap <leader>oF :Files<CR>

let g:which_key_map['o'] = {'name' : '+Navigate',
      \ 'f'    : 'git file search',
      \ 'a'    : 'NERDtree',
      \ 'F'    : 'all file search',
      \ 'p'    : 'recent files',
      \ 'o'    : 'open files',
      \ 'm'    : 'marks',
      \ '/'    : 'text search buffer',
      \ 's'    : 'text search',
      \ 'h'    : 'file history',
      \ 'n'    : 'text search across loaded buffers',
      \ 'g'    : 'git commits of the current buffer',
      \ 'G'    : 'git commits of the repository',
      \ 't'    : 'tag search',
      \ ';'    : 'toggle tagbar'
      \ }

