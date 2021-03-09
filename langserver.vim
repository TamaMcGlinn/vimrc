" Initialization
if has("win32")
  let g:LanguageClient_serverCommands = {
      \ 'ada': ['C:\ada_language_server\ada_language_server.exe'],
      \ 'python' : ['pyls.exe'],
      \ 'cpp' : ['C:\clangd_10.0.0\bin\clangd.exe']
      \ }
else
  let g:LanguageClient_serverCommands = {
      \ 'ada': ['/usr/local/ada_language_server/ada_language_server'],
      \ 'python' : ['/usr/local/bin/pyls'],
      \ 'cpp' : ['/usr/bin/clangd'],
      \ 'sh' : ['diagnostic-languageserver']
      \ }
endif

let g:LanguageClient_rootMarkers = {
        \ 'ada': ['*.gpr']
        \ }

" deprecated in favour of CoC
" " Mappings
" set signcolumn=no 
" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" nnoremap <silent> gs :call LanguageClient#textDocument_documentSymbol()<CR>
" nnoremap <silent> g. :call LanguageClient#textDocument_codeAction()<CR>
"
" " Settings
" set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()

