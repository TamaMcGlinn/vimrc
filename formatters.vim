" sourced from ~/vimrc/intellisense.vim
source ~/private_vimrc/formatters.vim

function! ApplyCustomFormatters() abort
  call codefmt#FormatBuffer('copyright')
  if expand('%:e') ==# 'h'
    call call('codefmt#FormatBuffer', ['header_guards'])
  endif
  if expand('%:e') ==# 'cpp' || expand('%:e') ==# 'h' || expand('%:e') ==# 'cu'
    call codefmt#FormatBuffer('clang-format')
  endif
  if expand('%:e') ==# 'lua'
    call ApplyLuaFormatters()
  endif
endfunction

function! ApplyPythonFormatters() abort
  call codefmt#FormatBuffer('black')
  call codefmt#FormatBuffer('isort')
endfunction

function! ApplyLuaFormatters() abort
  lua << EOF
  local lua_format_client = nil
  local clients = vim.tbl_values(vim.lsp.buf_get_clients())
  for i = 1, #clients do
     client = clients[i]
     if clients[i].name == "efm" then
       lua_format_client = clients[i]
     end
  end
  -- lua_format_client.request("textDocument/formatting", {} , nil, vim.api.nvim_get_current_buf())
  local util = require("vim.lsp.util")
  local params = util.make_formatting_params({})
  local result, err = lua_format_client.request_sync("textDocument/formatting", params, timeout_ms, vim.api.nvim_get_current_buf())
  if result and result.result then
    util.apply_text_edits(result.result, 0, "")
  elseif err then
    vim.notify("vim.lsp.buf.formatting_sync: " .. err, vim.log.levels.WARN)
  end
EOF
endfunction

augroup autoformat
  autocmd!
  " autocmd BufWrite *.ad[sb] :Autoformat
  autocmd BufWritePre * call ApplyCustomFormatters()

  " defaults from https://github.com/google/vim-codefmt
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  " autocmd FileType python AutoFormatBuffer isort
  " autocmd FileType python AutoFormatBuffer black
  autocmd BufWritePre *.py call ApplyPythonFormatters()
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END
