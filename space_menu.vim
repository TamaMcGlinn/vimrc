let g:which_key_map = {}

nnoremap <leader>of :GFiles<CR>
nnoremap <leader>ot :Tags<CR>
nnoremap <leader>oG :Commits<CR>
nnoremap <leader>og :BCommits<CR>
nnoremap <leader>on :Lines<CR>
nnoremap <leader>oh :MundoToggle<CR>
nnoremap <leader>os :Rg<CR>
nnoremap <leader>o/ :BLines<CR>
nnoremap <leader>om :marks<CR>:normal! `<CR>
nnoremap <leader>oo :Buffers<CR>
nnoremap <leader>op :MRU<CR>
nnoremap <leader>oF :Files<CR>

let g:which_key_map['o'] = {'name' : '+Navigate',
      \ 'f'    : 'git file search',
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
      \ }

nnoremap <leader>fx :!chmod +x %<CR>
nnoremap <leader>fs :source %<CR>
nnoremap <leader>fr :e! %<CR>
nnoremap <leader>fD :call delete(expand('%')) \| bp \| bdelete! #<CR>

let g:which_key_map['f'] = {'name': '+File',
             \'x': 'Set executable',
             \'s': 'Source',
             \'r': 'Reload',
             \'D': 'Delete',
             \}

nnoremap <leader>rR :CocRestart<CR>
nnoremap <leader>rR :CocRestart<CR>
nnoremap <leader>rn :call CocActionAsync("rename")<CR>
nnoremap <leader>rf :call CocActionAsync("formatSelected")<CR>
nnoremap <leader>ra :set operatorfunc=<SID>CodeActionFromSelected<CR>g@<CR>
nnoremap <leader>rc :call CocActionAsync("codeAction", "")<CR>
nnoremap <leader>re :call CocActionAsync("doQuickfix")<CR>
nnoremap <leader>rd :CocList diagnostics<CR>
nnoremap <leader>rE :CocList extensions<CR>
nnoremap <leader>rC :CocList commands<CR>
nnoremap <leader>rb :CocList outline<CR>
nnoremap <leader>rs :CocList -I symbols<CR>
nnoremap <leader>rj :CocNext<CR><CR>
nnoremap <leader>rk :CocPrev<CR><CR>
nnoremap <leader>rp :CocListResume<CR>
nnoremap <leader>rm :CocFix<CR>

let g:which_key_map['r'] = {'name': '+Refactor',
      \'R': 'Coc Restart',
      \'n': 'Symbol rename',
      \'f': 'Format selected',
      \'a': 'codeAction to selected region',
      \'c': 'codeAction to buffer',
      \'e': 'Autofix current line',
      \'d': 'Show all diagnostics',
      \'E': 'Manage extensions',
      \'C': 'Show commands',
      \'b': 'Find symbol in buffer',
      \'s': 'Find symbol everywhere',
      \'j': 'Default action for next item',
      \'k': 'Default action for previous item',
      \'p': 'Resume latest coc list',
      \'m': 'Coc fix menu',
      \}

" Dir
nnoremap <leader>qq :call DirToCurrentLine()<CR>
nnoremap <leader>qg :Gcd<CR>
nnoremap <leader>qo :copen<CR>
nnoremap <leader>qc :cclose<CR>

let g:which_key_map['q'] = {'name': '+Dir/Quickfix',
             \'q': 'current file',
             \'g': 'git root',
             \'o': 'Quickfix open',
             \'c': 'Quickfix close',
             \}

" Tabs
nnoremap <leader>to :tabnew<CR>
nnoremap <leader>tq :tabc<CR>
nnoremap <leader>tw :bp \| bd! #<CR>
nnoremap <leader>t, call MoveToPrevTab()<CR>
nnoremap <leader>t. call MoveToNextTab()<CR>
nnoremap <leader>th <CR>
nnoremap <leader>tl <CR>

let g:which_key_map['t'] = {'name': '+Tabs/Buffers',
             \'o': 'New tab',
             \'q': 'Close tab',
             \'w': 'Close and go back',
             \',': 'Move to previous tab',
             \'.': 'Move to next tab',
             \'h': 'Shift tab left',
             \'l': 'Shift tab right',
             \}
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

call which_key#register('<Space>', "g:which_key_map")
