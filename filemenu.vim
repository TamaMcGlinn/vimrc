
if !exists("g:source_current_file_defined")
  fu SourceCurrentFile() abort
    if expand('%:e') ==# 'lua'
      luafile %
    else
      source %
    endif
  endfu
  let g:source_current_file_defined = v:true
  " this workaround is so that when reloading vimrc, this function's
  " redefinition doesn't throw errors. When you need to modify this function,
  " you need to restart vim
endif

nnoremap <leader>fx :!chmod +x %<CR>
nnoremap <leader>fq :wq<CR>
nnoremap <leader>fs :w<BAR>call SourceCurrentFile()<CR>
nnoremap <leader>ff :CocCommand clangd.switchSourceHeader<CR>
nnoremap <leader>ft :set ft=
nnoremap <leader>fS :SudoWrite<CR>
nnoremap <leader>fa :Startify<CR>
nnoremap <leader>fw :write<CR>
nnoremap <leader>fW :noautocmd write<CR>
nnoremap <leader>fr :e! %<CR>
nnoremap <leader>fD :call delete(expand('%')) \| bp \| bdelete! #<CR>
nnoremap <leader>fp :let @+=expand('%')<CR>
nnoremap <leader>fP :let @+=expand('%:p')<CR>

let g:which_key_map['f'] = {'name': '+File',
             \'q': 'Save & quit',
             \'x': 'Set executable',
             \'a': 'Startify',
             \'w': 'write',
             \'f': 'switch source / header',
             \'W': 'Noformat write',
             \'s': 'Source',
             \'t': 'Set filetype',
             \'S': 'SudoWrite',
             \'r': 'Reload',
             \'D': 'Delete',
             \'p': 'Copy relative filename',
             \'P': 'Copy absolute filename',
             \}
