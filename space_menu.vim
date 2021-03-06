let fzfMenu = {'name':           'Nav Menu',
             \'f': [':GFiles',    'git file search'],
             \'F': [':Files',    'all file search'],
             \'p': [':MRU',       'recent files'],
             \'o': [':Buffers',  'open files'],
             \'m': [':marks<CR>:normal! `', 'marks'],
             \'/': [':BLines',   'text search into current buffer'],
             \'s': [':Rg',       'text search'],
             \'h': [':MundoToggle','file history'],
             \'n': [':Lines',    'text search across loaded buffers'],
             \'g': [':BCommits', 'git commits of the current buffer'],
             \'G': [':Commits',  'git commits of the repository'],
             \'t': [':Tags',     'tag search'],
             \}

" Todo map this:
" noremap <silent> <F7> :call OpenUnmerged()<CR>

let buildMenu = {'name':         'Build/test',
             \'m': [':!make', 'Make'],
             \'k': ['call Make_In_File_Dir()', 'Make file dir'],
             \'b': ['call BazelBuildHere()', 'Bazel build file'],
             \'t': ['call BazelTestHere()', 'Bazel test here'],
             \'i': ["call Compile(expand('%'))", 'Compile file']
             \}

let fileMenu = {'name':          'File',
             \'x': [':!chmod +x %', 'Chmod +x'],
             \'r': [':e! %', 'Reload'],
             \'D': ["call delete(expand('%')) | bp | bdelete! #", 'Delete'],
             \}

let dirMenu = {'name':          'Directory',
             \'q': ['call DirToCurrentLine()', 'current file'],
             \'g': [':Gcd', 'git root'],
             \}

let tabMenu = {'name':         'Tabs & Buffers',
             \'o': [':tabnew', 'New tab'],
             \'q': [':tabc', 'Close tab'],
             \'w': [':bp <BAR> bd #', 'Close and go back'],
             \',': ['call MoveToPrevTab()', 'Move buffer to previous tab'],
             \'.': ['call MoveToNextTab()', 'Move buffer to next tab'],
             \'h': ['', 'Shift tab left'],
             \'l': ['', 'Shift tab right'],
             \}

" Define the menu content with a Vim dictionary
let g:leaderMenu = {'name':  'Main menu',
             \'o': [fzfMenu,  'Navigate'],
             \'n': [g:flogmenu_gitmenu,  'Git'],
             \'b': [buildMenu,'Build'],
             \'f': [fileMenu, 'File'],
             \'c': [terminalMenu, 'CMD'],
             \'q': [dirMenu, 'Directory'],
             \'t': [tabMenu, 'Tabs & Buffers'],
             \}

nnoremap <Space> <Nop>
let mapleader = "\<Space>"

nnoremap <silent> <leader> :LeaderMapper<CR>

