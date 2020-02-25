" Sessions
if has("win32")
  let sessiondir="C:\\Users\\bc2scf22\\vimsessions\\"
else
  let sessiondir="/home/tama/vimsessions/"
endif
fu! SaveSession( file )
  execute 'mksession! ' . g:sessiondir . a:file . '.vim'
endfunction
fu! RestoreSession( file )
  if filereadable( g:sessiondir . a:file . '.vim' )
    execute 'source ' . g:sessiondir . a:file . '.vim'
  endif
  if has("cscope")
    " add CScope database in current directory
    if filereadable("cscope.out")
      silent cs add cscope.out
    endif
  endif
endfunction

nnoremap <Leader>ss :call SaveSession( 'default' )<CR>
nnoremap <Leader>sl :call RestoreSession( 'default' )<CR>
nnoremap <Leader>sw :call SaveSession( input('Save Session: ') )<CR>
nnoremap <Leader>so :call RestoreSession( input('Load Session: ') )<CR>
set sessionoptions-=options  " Don't save options
let g:session_autoload = 'no'

