nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
" nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

lua << EOF
require('trouble').setup {
      -- action_keys = {
      --   toggle_fold = { '<Space>' }
      -- },
      signs = {
        error = ' ',
        warning = ' ',
        hint = ' ',
        information = ' '
      }
    }

vim.cmd [[
    sign define DiagnosticSignError text=  linehl= texthl=DiagnosticSignError numhl=
    sign define DiagnosticSignWarn text=   linehl= texthl=DiagnosticSignWarn numhl=
    sign define DiagnosticSignInfo text=   linehl= texthl=DiagnosticSignInfo numhl=
    sign define DiagnosticSignHint text=   linehl= texthl=DiagnosticSignHint numhl=
]]
EOF
