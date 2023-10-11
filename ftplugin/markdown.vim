if !exists('g:docjump_defined')

  " this workaround is so that when opening a new markdown while executing
  " DocJump we don't try to redefine DocJump again and get an error: "can't
  " redefine DocJump, it is in use"
  let g:docjump_defined = v:true

  function! GetJumpTarget(ref) abort
    let l:cmd = "md_jump " . a:ref
    let l:results = systemlist(l:cmd)
    if len(l:results) < 1
      return v:null
    endif
    return l:results[0]
  endfunction

  function! DocJump(ref) abort
    let l:result = GetJumpTarget(a:ref)
    if l:result is v:null
      return
    endif
    let l:file = substitute(copy(l:result), '^\([^:]*\):.*$', '\1', '')
    let l:line = v:null
    if l:result =~# '^[^:]*:[0-9]*:.*$'
      let l:line = substitute(copy(l:result), '^[^:]*:\([0-9]*\):.*$', '\1', '')
    else
      echom l:result . " doesn't have a lineno."
    endif
    let l:target = {"filename": l:file, "line": l:line, "column": v:null}
    call better_gf#JumpToTarget(l:target)
  endfunction
endif

nnoremap <silent> <buffer> gd :call DocJump(expand('<cword>'))<CR>
