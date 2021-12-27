" Terminal settings
tnoremap <ESC> <C-\><C-n>

function! OpenTerminal(open_dos_terminal=v:false) abort
  execute ':term'
  call feedkeys('A')
  if has('win32')
    let l:enter = "\<CR>"
    let l:command = 'doskey.cmd' . l:enter
    if a:open_dos_terminal
      let l:bash_start_command='cmd.exe /c "C:\\Progra~1\Git\bin\bash.exe --login -i"'
      let l:command .= l:bash_start_command . l:enter
    endif
    let l:command .= 'cls' . l:enter
    echom l:command
    call feedkeys(l:command)
  endif
endfunction

function! OpenSplitTerminal(open_dos_terminal=v:false) abort
  execute ':split'
  execute ':wincmd j'
  call OpenTerminal()
endfunction

function! OpenDOSTerminal() abort
  call OpenTerminal(v:true)
endfunction

function! OpenSplitDOSTerminal() abort
  call OpenSplitTerminal(v:true)
endfunction

if has('win32')
  augroup TerminalMappings
    autocmd!
      " handle the double-exit required because of nesting Git terminal in cmd
      autocmd TermOpen * nnoremap <buffer> <C-D> aexit<CR>exit<CR>
      autocmd TermOpen * tnoremap <buffer> <C-D> exit<CR>exit<CR>
  augroup END
endif

" TODO somehow use the smarter better_gf#JumpToNormalBuffer()
function! UseAbsoluteFilenameInTermBelow(prefix, ...) abort
 let l:postfix = get(a:, 1, '')
 let l:filename = expand('%:p')
 " switch to bottom terminal buffer
 silent execute 'wincmd j'
 call feedkeys('a' . a:prefix . l:filename . l:postfix)
endfunction

function! UseRelativeFilenameInTermBelow(prefix, ...) abort
   let l:postfix = get(a:, 1, '')
   let l:filename = bufname('%')
   " switch to bottom terminal buffer
   silent execute 'wincmd j'
   call feedkeys('a' . a:prefix . l:filename . l:postfix)
endfunction

" cc for commandline, cs for split terminal below,
" windows only: cd for dos terminal, csd for split dos terminal below
if has('win32')
  " Note, you need to empty the file Git\etc\motd
  " to get rid of the 'Welcome to Git' message
  set shell=cmd.exe
  nnoremap <Leader>cc :call OpenTerminal()<CR>
  nnoremap <Leader>cd :call OpenDOSTerminal()<CR>
  nnoremap <Leader>csd :call OpenSplitDOSTerminal()<CR>
else
  nnoremap <Leader>cc :call OpenTerminal()<CR>
  nnoremap <Leader>cs :call OpenSplitTerminal()<CR>
endif

let g:which_key_map['c'] = {'name': '+Terminal',
             \'c': 'Full window',
             \'s': 'Split below',
             \'f': 'relative filename',
             \'F': 'absolute filename',
             \'t': 'Tab',
             \'d': 'DOS CMD',
             \}

nnoremap <Leader>cf :call UseRelativeFilenameInTermBelow('')<CR>
nnoremap <Leader>cF :call UseAbsoluteFilenameInTermBelow('')<CR>

