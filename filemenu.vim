
if !exists('g:source_current_file_defined')
  fu SourceCurrentFile() abort
    if expand('%:e') ==# 'lua'
      luafile %
    elseif expand('%:e') ==# 'vim'
      source %
    endif
  endfu
  let g:source_current_file_defined = v:true
  " this workaround is so that when reloading vimrc, this function's
  " redefinition doesn't throw errors. When you need to modify this function,
  " you need to restart vim
endif

nnoremap <silent> <leader>fx :!chmod +x %<CR>
nnoremap <silent> <leader>fq :wq<CR>
nnoremap <silent> <leader>fQ :qall!<CR>
nnoremap <silent> <leader>fh :%!xxd<CR>
nnoremap <silent> <leader>fs :w<BAR>call SourceCurrentFile()<CR>
nnoremap <silent> <leader>ff :call CurtineIncSw()<CR>
nnoremap <silent> <leader>ft :set ft=
nnoremap <silent> <leader>fS :SudoWrite<CR>
nnoremap <silent> <leader>fa :Startify<CR>
nnoremap <silent> <leader>fw :set buftype=""<CR>:write!<CR>
nnoremap <silent> <leader>fR :Move %
nnoremap <silent> <leader>fW :noautocmd write<CR>
nnoremap <silent> <leader>fr :e! %<CR>
nnoremap <silent> <leader>fD :call delete(expand('%')) \| bp \| bdelete! #<CR>
nnoremap <silent> <leader>fp :let @+=expand('%')<CR>
nnoremap <silent> <leader>fP :let @+=expand('%:p')<CR>

let g:which_key_map['f'] = {'name': '+File',
             \'q': 'Save & quit',
             \'x': 'Set executable',
             \'a': 'Startify',
             \'h': 'read HEX',
             \'w': 'write',
             \'W': 'Noformat write',
             \'f': 'switch source / header',
             \'s': 'Source',
             \'t': 'Set filetype',
             \'S': 'SudoWrite',
             \'r': 'Reload',
             \'R': 'Rename',
             \'D': 'Delete',
             \'p': 'Copy relative filename',
             \'P': 'Copy absolute filename',
             \}
