let fzfMenu = {'name':           'Nav Menu',
             \'f': [':GFiles',    'git file search'],
             \'F': [':Files',    'all file search'],
             \'p': [':MRU',       'recent files'],
             \'P': [':Buffers',  'open files search'],
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

let flogMenu = {'name':          'Flog Menu',
 \'l': [':Flog -all', 'Normal'],
 \'c': [':Flog', 'Current branch'],
 \'s': [':Flogsplit -all', 'Split'],
 \'v': [':vertical Flogsplit -all', 'Vertical split'],
 \'t': [':Flog -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%', 'File history'],
 \'k': [':vertical Flogsplit -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%', 'Vsplit file history'],
 \'1': [':Flog -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%:h', 'File ./ history'],
 \'2': [':Flog -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%:h:h', 'File ../ history'],
 \'3': [':Flog -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%:h:h:h', 'File ../../ history'],
 \'4': [':Flog -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%:h:h:h:h', 'File ../../../ history'],
 \'5': [':Flog -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%:h:h:h:h:h', 'File ../../../../ history'],
 \'6': [':Flog -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%:h:h:h:h:h:h', 'File ../../../../../ history'],
 \}

let gitMenu = {'name':           'Git Menu',
             \'s': [':Gstatus', 'Status'],
             \'r': [':Gedit', 'Toggle index / working file version'],
             \'R': [':Gread', 'Reset to index'],
             \'j': [':Git fetch --all', 'Fetch'],
             \'J': [':Git pull', 'Pull'],
             \'p': [':Git push', 'Push'],
             \'P': [':Git push --force-with-lease', 'Push force (lease)'],
             \'z': [':Git blame', 'Blame file'],
             \'b': [':GBranches', 'Branches'],
             \'c': [':Git commit', 'Commit'],
             \'.': [':Git add .', 'Add CWD'],
             \',': [':Git add %', 'Add file'],
             \'k': [':Git add %:h', 'Add file dir'],
             \'l': [flogMenu, 'Log'],
             \}

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
             \'-': [':e %:h', 'explore file directory'],
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
             \'n': [gitMenu,  'Git'],
             \'b': [buildMenu,'Build'],
             \'f': [fileMenu, 'File'],
             \'q': [dirMenu, 'Directory'],
             \'t': [tabMenu, 'Tabs & Buffers'],
             \}

nnoremap <Space> <Nop>
let mapleader = "\<Space>"

nnoremap <silent> <leader> :LeaderMapper "<Space>"<CR>

