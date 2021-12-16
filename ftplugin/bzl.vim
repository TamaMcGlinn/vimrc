
" Return the file and optional target within that file specified
" by a line such as:
" load("//support/bazel/rule/spark:rules.bzl", "z_spark_prove_test")
" this returns file -> "support/bazel/rule/spark/rules.bzl" target -> "z_spark_prove_test"
" if the load statement imports multiple targets then the returned target is v:null
fu! GetBazelLoadTarget(line) abort
  let l:line = a:line
  if l:line =~# '^load("//'
    if l:line =~# '\.bzl", "[^"]*")'
      let l:target = substitute(l:line, '.*\.bzl", "\([^"]*\)").*', '\1', '')
    else
      let l:target = v:null
    endif
    let l:line = substitute(l:line, '^load("//\([^"]*\)".*', '\1', '')
    if l:line =~# '^[^:]*:[^.]*\.bzl'
      let l:file = substitute(l:line, ':', '/', '')
      return { 'file': l:file, 'target': l:target }
    else
      throw "Unrecognized bazel file: " .. l:line
    endif
  else
    return v:null
  endif
endfunction

fu! JumpToTargetWithinFile(target) abort
  call search("[() ]" .. a:target .. "[() ]")
  call search("^" .. a:target .. "[() ]")
endfunction

fu! JumpToBazelDefinition() abort
  let l:line = getline('.')
  let l:jump = GetBazelLoadTarget(l:line)
  if l:jump is v:null
    if l:line =~# '^[a-zA-Z_]*('
      let l:target = substitute(l:line, '(.*', '', '')
      let l:line = search('^load("[^"]*".*"' .. l:target .. '".*)', 'n')
      if l:line == 0
        throw "Unable to find load for " .. l:target
      endif
      let l:jump = GetBazelLoadTarget(getline(l:line))
      if l:jump is v:null
        throw "Unable to find target"
      endif
      let l:jump['target'] = l:target
    endif
  endif
  call better_gf#Openfile(l:jump['file'])
  if !(l:jump['target'] is v:null)
    call JumpToTargetWithinFile(l:jump['target'])
  endif
endfunction

nnoremap <silent> <buffer> gd :call JumpToBazelDefinition()<CR>
