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

" Git log
nnoremap <leader>gll :call flogmenu#open_git_log()<CR>
nnoremap <leader>glc :Flog<CR>
nnoremap <leader>gls :Flogsplit -all<CR>
nnoremap <leader>glv :vertical Flogsplit -all<CR>
nnoremap <leader>glt :Flog -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%<CR>
nnoremap <leader>glk :vertical Flogsplit -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%<CR>
nnoremap <leader>gl1 :Flog -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%:h<CR>
nnoremap <leader>gl2 :Flog -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%:h:h<CR>
nnoremap <leader>gl3 :Flog -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%:h:h:h<CR>
nnoremap <leader>gl4 :Flog -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%:h:h:h:h<CR>
nnoremap <leader>gl5 :Flog -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%:h:h:h:h:h<CR>
nnoremap <leader>gl6 :Flog -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%:h:h:h:h:h:h<CR>

let g:git_log_menu = {'name': '+Log',
 \'l': 'Show git log',
 \'c': 'Current branch',
 \'s': 'Split',
 \'v': 'Vertical split',
 \'t': 'File history',
 \'k': 'Vsplit file history',
 \'1-6': 'File ..* history',
 \'1': 'which_key_ignore',
 \'2': 'which_key_ignore',
 \'3': 'which_key_ignore',
 \'4': 'which_key_ignore',
 \'5': 'which_key_ignore',
 \'6': 'which_key_ignore',
 \}

" TODO make these really work
" let g:flogmenu_stashmenu = {'name': 'Git stash menu',
"               \'h': [':Git -p stash show -p stash', 'Show'],
"               \'l': [':Git -p stash list',          'List'],
"               \'a': [':Git stash apply stash@{',    'Apply'],
"               \'p': [':Git stash pop',              'Pop'],
"               \'s': [':Git stash push<space>',      'Stash'],
"               \}

" Git
nnoremap <leader>ga :call flogmenu#open_all_windows()<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gr :Gedit<CR>
nnoremap <leader>gR :Gread<CR>
nnoremap <leader>gj :Git fetch --all<CR>
nnoremap <leader>gJ :Git pull<CR>
nnoremap <leader>gk :Git push<CR>
nnoremap <leader>gK :Git push --force-with-lease<CR>
nnoremap <leader>gn :Gvdiffsplit!<CR>
nnoremap <leader>gz :Git blame<CR>
nnoremap <leader>gb :Twiggy<CR>
nnoremap <leader>gB :GBranches<CR>
nnoremap <leader>gt :GTags<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>g. :Git add .<CR>
nnoremap <leader>gg :Git add %<CR>
nnoremap <leader>gu :call flogmenu#open_unmerged()<CR>
nnoremap <leader>gd :Git add %:h<CR>
nnoremap <leader>g/ :GitGrep<CR>

let g:which_key_map['g'] = {'name': 'Git Menu',
             \'a': 'All windows',
             \'s': 'Status',
             \'h': 'Stash',
             \'r': 'Toggle index / working file version',
             \'R': 'Reset to index',
             \'j': 'Fetch',
             \'J': 'Pull',
             \'k': 'Push',
             \'K': 'Push force (lease)',
             \'n': 'Diff file',
             \'z': 'Blame file',
             \'b': 'Branches',
             \'B': 'Branch search',
             \'t': 'Tags',
             \'c': 'Commit',
             \'.': 'Add CWD',
             \'g': 'Add file',
             \'u': 'Open unmerged files',
             \'d': 'Add file dir',
             \'l': g:git_log_menu,
             \'/': 'Search',
             \}

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

call which_key#register('<Space>', "g:which_key_map")
