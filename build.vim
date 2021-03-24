fu! Make_In_File_Dir() abort
  execute 'sp'
  " switch to new buffer
  silent execute 'wincmd j'
  lcd %:p:h/..
  execute 'term make'
  execute 'cd' getcwd(-1)
  " switch back to top buffer
  silent execute 'wincmd k'
endfunction

" Build current file
fu! GetCompileCommand(file) abort
  let s:cc_db = json_decode(readfile('compile_commands.json'))
  let s:current_file = filter(s:cc_db, 'v:val.file=~".*".a:file')
  return s:current_file[0].command
endfunction

fu! Compile(file) abort
  let &makeprg = GetCompileCommand(a:file)
  silent execute 'make'
  call system('rm ' . expand('%:t:r') . '.o')
  silent execute 'copen'
endfunction

source ~/vimrc/bazel.vim

let buildMenu = {'name':         'Build/test',
             \'m': [':!make',                    'Make'],
             \'a': [':!gprbuild -p',             'Gprbuild'],
             \'k': ['call Make_In_File_Dir()',   'Make file dir'],
             \'b': ['call BazelBuildHere()',     'Bazel build file'],
             \'t': ['call BazelTestHere()',      'Bazel test here'],
             \'i': ["call Compile(expand('%'))", 'Compile file']
             \}

