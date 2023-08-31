function! DiagnosticInfo() abort
  let l:warning_codes = GetDiagnosticCodes()
  for l:warning_code in l:warning_codes
    call system("xdg-open https://www.shellcheck.net/wiki/" .. l:warning_code)
  endfor
endfunction

function! DiagnosticIgnore() abort
  let l:warning_codes = GetDiagnosticCodes()
  for l:warning_code in l:warning_codes
    let l:current_line = line('.')
    call append(l:current_line - 1, '# shellcheck disable=' .. l:warning_code)
  endfor
endfunction

function! GetDiagnosticCodes() abort
  let l:diagnostics = luaeval('vim.lsp.diagnostic.get_line_diagnostics()')
  if len(l:diagnostics) == 0
    echo "No diagnostics for current line"
    return
  endif
  let l:warning_codes = []
  for l:diagnostic in l:diagnostics
    let l:warning_code = substitute(substitute(l:diagnostic.message, ".*\[", "", ""), "\].*", "", "")
    call add(l:warning_codes, l:warning_code)
  endfor
  return l:warning_codes
endfunction

nnoremap <Leader>di :call DiagnosticInfo()<CR>
nnoremap <Leader>dI :call DiagnosticIgnore()<CR>
