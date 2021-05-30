" Initialization
if has('win32')
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

