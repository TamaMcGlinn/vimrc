
let s:plugin = maktaba#plugin#Get('codefmt')

""
" @private
" Formatter: copyright.py
function! codefmt#copyright#GetFormatter() abort
  let l:formatter = {
      \ 'name': 'copyright',
      \ 'setup_instructions': 'You will need the copyright.py file from Tama'}

  function l:formatter.IsAvailable() abort
    if executable('copyright.py')
      return 1
    else
      return 0
    endif
  endfunction

  function l:formatter.Format() abort
    let l:fname = expand('%:p')
    call codefmt#formatterhelpers#Format(['copyright.py', l:fname])
  endfunction

  function l:formatter.AppliesToBuffer() abort
    if &filetype is# 'c' || &filetype is# 'cpp' || &filetype is# 'bzl' || &filetype is# 'py' || &filetype is# 'smarty' || &filetype is# 'cmake' || &filetype is# 'make'
      return 1
    endif
    let l:filename = expand('%:t')
    if l:filename ==# 'CMakeLists.txt' || l:filename ==# 'WORKSPACE'
      return 1
    endif
    return 0
  endfunction

  return l:formatter
endfunction

let g:codefmt_registry = maktaba#extension#GetRegistry('codefmt')
call g:codefmt_registry.AddExtension(codefmt#copyright#GetFormatter())
