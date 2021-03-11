let fzfMenu = {'name':           'Nav Menu',
             \'f': [':GFiles',               'git file search'],
             \'F': [':Files',                'all file search'],
             \'p': [':MRU',                  'recent files'],
             \'o': [':Buffers',              'open files'],
             \'m': [':marks<CR>:normal! `',  'marks'],
             \'/': [':BLines',               'text search into current buffer'],
             \'s': [':Rg',                   'text search'],
             \'h': [':MundoToggle',          'file history'],
             \'n': [':Lines',                'text search across loaded buffers'],
             \'g': [':BCommits',             'git commits of the current buffer'],
             \'G': [':Commits',              'git commits of the repository'],
             \'t': [':Tags',                 'tag search'],
             \}

let buildMenu = {'name':         'Build/test',
             \'m': [':!make',                    'Make'],
             \'k': ['call Make_In_File_Dir()',   'Make file dir'],
             \'b': ['call BazelBuildHere()',     'Bazel build file'],
             \'t': ['call BazelTestHere()',      'Bazel test here'],
             \'i': ["call Compile(expand('%'))", 'Compile file']
             \}

let fileMenu = {'name':          'File',
             \'x': [':!chmod +x %',                               'Chmod +x'],
             \'s': [':source %',                                  'Source'],
             \'r': [':e! %',                                      'Reload'],
             \'D': ["call delete(expand('%')) | bp | bdelete! #", 'Delete'],
             \}

let refactorMenu = {'name':          'Refactor',
      \'n': ['call CocActionAsync("rename")',                      'Symbol rename'],
      \'f': ['call CocActionAsync("formatSelected")',              'Format selected'],
      \'a': ['set operatorfunc=<SID>CodeActionFromSelected<CR>g@', 'codeAction to selected region'],
      \'c': ['call CocActionAsync("codeAction", "")',              'codeAction to buffer'],
      \'e': ['call CocActionAsync("doQuickfix")',                  'Autofix current line'],
      \'d': [':CocList diagnostics',                               'Show all diagnostics'],
      \'E': [':CocList extensions',                                'Manage extensions'],
      \'C': [':CocList commands',                                  'Show commands'],
      \'b': [':CocList outline',                                   'Find symbol in buffer'],
      \'s': [':CocList -I symbols',                                'Find symbol everywhere'],
      \'j': [':CocNext<CR>',                                       'Default action for next item'],
      \'k': [':CocPrev<CR>',                                       'Default action for previous item'],
      \'p': [':CocListResume<CR>',                                 'Resume latest coc list'],
      \'m': [':CocFix<CR>',                                        'Coc fix menu'],
      \}

let dirMenu = {'name':          'Directory',
             \'q': ['call DirToCurrentLine()', 'current file'],
             \'g': [':Gcd',                    'git root'],
             \}

let tabMenu = {'name':         'Tabs & Buffers',
             \'o': [':tabnew',                   'New tab'],
             \'q': [':tabc',                     'Close tab'],
             \'w': [':bp | bd! #',               'Close and go back'],
             \',': ['call MoveToPrevTab()',      'Move buffer to previous tab'],
             \'.': ['call MoveToNextTab()',      'Move buffer to next tab'],
             \'h': ['',                          'Shift tab left'],
             \'l': ['',                          'Shift tab right'],
             \}

" Define the menu content with a Vim dictionary
let g:leaderMenu = {'name':  'Main menu',
             \'o': [fzfMenu,              'Navigate'],
             \'n': [g:flogmenu_gitmenu,   'Git'],
             \'b': [buildMenu,            'Build'],
             \'r': [refactorMenu,         'Refactor'],
             \'f': [fileMenu,             'File'],
             \'q': [dirMenu,              'Directory'],
             \'t': [tabMenu,              'Tabs & Buffers'],
             \'g': [debugMenu,            'Debug'],
             \}

