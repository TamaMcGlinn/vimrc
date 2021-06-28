
" Mappings
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> <buffer> gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <buffer> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <buffer> gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> <buffer> <leader>rn :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <buffer> gs :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <silent> <buffer> g. :call LanguageClient#textDocument_codeAction()<CR>
nnoremap <silent> <buffer> <leader>rR :LanguageClientStop<CR>:LanguageClientStart<CR>

" Settings
set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()

" source ~/vimrc/vebugger_mappings.vim
