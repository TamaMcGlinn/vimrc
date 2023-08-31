autocmd BufWritePost .exrc nested silent ExrcTrust

" projects can have an .exrc file defining hooks such as:

" let s:projectroot = expand('<sfile>:p:h')
"
" fu! StartsWith(longer, shorter) abort
"   return a:longer[0:len(a:shorter)-1] ==# a:shorter
" endfunction
"
" fu! Project_Local_Config_Applies() abort
"   let current_file = expand('%:p')
"   return StartsWith(current_file, s:projectroot)
" endfunction
"
" fu! Local_CompileFile() abort
"   call AbeCompile()
" endfunction


" these can be called from any vimrc config, e.g.

" fu! Compile(file) abort
"   if exists ('*Project_Local_Config_Applies')
"     if Project_Local_Config_Applies()
"       if exists ('*Local_CompileFile')
"         call Local_CompileFile()
"         return
"       endif
"     endif
"   endif
"   echom "Add Local_CompileFile function to .exrc to tell me how to compile!"
" endfunction
