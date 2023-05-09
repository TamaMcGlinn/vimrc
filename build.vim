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
  if exists ('*Project_Local_Config_Applies')
    if Project_Local_Config_Applies()
      if exists ('*Local_CompileFile')
        call Local_CompileFile()
        return
      endif
    endif
  endif
  " fallback, try using compile_commands.json
  if filereadable("compile_commands.json")
    silent execute '!' . GetCompileCommand(a:file)
  else
    echom "Add Local_CompileFile function to .exrc to tell me how to compile!"
  endif
endfunction

source ~/vimrc/bazel.vim

nnoremap <Leader>ii :make<CR>
nnoremap <Leader>im :execute '!make ' . substitute(expand('%:t'), '\.adb$', '', '')<CR>
nnoremap <Leader>id :execute '!' . substitute(substitute(expand('%:t'), '\.adb$', '', ''), '^', 'bin/', '')<CR>
nnoremap <Leader>ik :call Make_In_File_Dir()<CR>
nnoremap <Leader>ib :call BazelBuildHere()<CR>
nnoremap <Leader>it :call BazelTestHere()<CR>
nnoremap <Leader>if :call Compile(expand('%'))<CR>
nnoremap <Leader>ig :call PutTargetInTermBelow('')<CR>

let g:which_key_map['i'] = {'name': '+Build',
             \'i': 'Make',
             \'k': 'Make file dir',
             \'b': 'Bazel build file',
             \'t': 'Bazel test here',
             \'f': 'Compile file',
             \'g': 'Get bazel target',
             \'c': 'CompilerExplorer'
             \}

