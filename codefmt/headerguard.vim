
let s:plugin = maktaba#plugin#Get('codefmt')

""
" @private
" Formatter: header_guards.py
function! codefmt#headerguard#GetFormatter() abort
  let l:formatter = {
      \ 'name': 'header_guards',
      \ 'setup_instructions': 'You will need the header_guards.py file from Tama'}

  function l:formatter.IsAvailable() abort
    if executable('header_guards.py')
      return 1
    else
      return 0
    endif
  endfunction

  function l:formatter.Format() abort
    let l:fname = expand('%:p')
    call codefmt#formatterhelpers#Format(['header_guards.py', l:fname])
  endfunction

  function l:formatter.AppliesToBuffer() abort
    if &filetype is# 'c' || &filetype is# 'cpp'
      if expand('%:e') ==# 'h'
        return 1
      endif
    endif
    return 0
  endfunction

  return l:formatter
endfunction

augroup header_guard_formatter
let g:codefmt_registry = maktaba#extension#GetRegistry('codefmt')
call g:codefmt_registry.AddExtension(codefmt#headerguard#GetFormatter())
