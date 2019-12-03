" Ada uses 3 spaces for indentation
autocmd Filetype ada setlocal expandtab tabstop=3 shiftwidth=3 softtabstop=3 signcolumn=yes
au BufRead,BufNewFile *.adb setlocal filetype=ada
au BufRead,BufNewFile *.ads setlocal filetype=ada
