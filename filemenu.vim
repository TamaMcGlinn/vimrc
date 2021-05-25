
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

function! CompareWithRightSide() abort
  diffthis
  execute 'normal! zi'
  wincmd l
  diffthis
  execute 'normal! zi'
  wincmd h
endfunction

nnoremap <leader>fx :!chmod +x %<CR>
nnoremap <leader>fq :wq<CR>
nnoremap <leader>fs :w<BAR>call SourceCurrentFile()<CR>
nnoremap <silent> <leader>ff :CocCommand clangd.switchSourceHeader<CR>
nnoremap <leader>ft :set ft=
nnoremap <leader>fS :SudoWrite<CR>
nnoremap <silent> <leader>fa :Startify<CR>
nnoremap <leader>fw :write<CR>
nnoremap <leader>fW :noautocmd write<CR>
nnoremap <leader>fo :pwd<CR>
nnoremap <leader>fl :call CompareWithRightSide()<CR>
nnoremap <leader>fr :e! %<CR>
nnoremap <silent> <leader>fD :call delete(expand('%')) \| bp \| bdelete! #<CR>
nnoremap <silent> <leader>fp :let @+=expand('%')<CR>
nnoremap <silent> <leader>fP :let @+=expand('%:p')<CR>

let g:which_key_map['f'] = {'name': '+File',
             \'q': 'Save & quit',
             \'x': 'Set executable',
             \'a': 'Startify',
             \'w': 'write',
             \'W': 'Noformat write',
             \'o': 'show pwd',
             \'f': 'switch source / header',
             \'s': 'Source',
             \'l': 'Compare to right',
             \'t': 'Set filetype',
             \'S': 'SudoWrite',
             \'r': 'Reload',
             \'D': 'Delete',
             \'p': 'Copy relative filename',
             \'P': 'Copy absolute filename',
             \}
