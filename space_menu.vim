let fzfMenu = {'name':           'FZF Menu',
             \'f': [':Files',    'FZF file search'],
             \'b': [':Buffers',  'FZF buffer search'],
             \'s': [':BLines',   'FZF text search into current buffer'],
             \'S': [':Lines',    'FZF text search across loaded buffers'],
             \'g': [':BCommits', 'FZF git commits of the current buffer'],
             \'G': [':Commits',  'FZF git commits of the repository'],
             \'t': [':Tags',     'FZF tag search'],
             \}

" Todo map this:
" noremap <silent> <F7> :call OpenUnmerged()<CR>

let flogMenu = {'name':          'Flog Menu',
 \'l': [':Flog -all', 'Normal'],
 \'c': [':Flog', 'Current branch'],
 \'s': [' :Flogsplit -all', 'Split'],
 \'v': [' :vertical Flogsplit -all', 'Vertical split'],
 \'t': [':Flog -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%', 'File history'],
 \'k': [' :vertical Flogsplit -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%', 'Vsplit file history'],
 \'1': [' :Flog -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%:h', 'File ./ history'],
 \'2': ['k :Flog -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%:h:h', 'File ../ history'],
 \'3': ['kk :Flog -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%:h:h:h', 'File ../../ history'],
 \'4': ['kkk :Flog -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%:h:h:h:h', 'File ../../../ history'],
 \'5': ['kkkk :Flog -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%:h:h:h:h:h', 'File ../../../../ history'],
 \'6': ['kkkkk :Flog -format=%ad\ [%h]\ {%an}%d\ (%S)\ %s -all -path=%:h:h:h:h:h:h', 'File ../../../../../ history'],
 \}

let gitMenu = {'name':           'Git Menu',
             \'s': [':Gstatus', 'Status'],
             \'r': [':Gedit', 'Toggle index / working file version'],
             \'j': [':Git fetch --all', 'Fetch'],
             \'J': [':Git pull', 'Pull'],
             \'p': [':Git push', 'Push'],
             \'P': [':Git push --force-with-lease', 'Push force with lease'],
             \'z': [':Git blame', 'Blame file'],
             \'b': [':GBranches', 'Branches'],
             \'c': [':Git commit', 'Commit'],
             \'.': [':Git add .', 'Add CWD'],
             \',': [':Git add %', 'Add file'],
             \'k': [':Git add %:h', 'Add file dir'],
             \'l': [flogMenu, 'Log'],
             \}

" Define the menu content with a Vim dictionary
let g:leaderMenu = {'name':  '',
             \'o': [fzfMenu,  'FZF'],
             \'n': [gitMenu,  'Git'],
             \}

nnoremap <Space> <Nop>
let mapleader = "\<Space>"

nnoremap <silent> <leader> :LeaderMapper "<Space>"<CR>

