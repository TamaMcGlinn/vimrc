" Initialization
if has("win32")
  let g:LanguageClient_serverCommands = {
      \ 'ada': ['C:\ada_language_server\ada_language_server.exe'],
      \ }
else
  let g:LanguageClient_serverCommands = {
      \ 'ada': ['/usr/local/ada_language_server/ada_language_server'],
      \ 'python' : ['/usr/local/bin/pyls'],
      \ }
endif

let g:LanguageClient_rootMarkers = {
        \ 'ada': ['*.gpr']
        \ }

" Mappings
set signcolumn=no 
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> gs :call LanguageClient#textDocument_documentSymbol()<CR>

" Settings
set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()

