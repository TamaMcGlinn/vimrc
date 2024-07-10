lua<<EOF
require("translate").setup({
    default = {
        command = "google",
        output = "replace",
    }
})
EOF

nnoremap <leader>ttp :lua require("configs.translate")()<CR>
vnoremap <leader>ttp :<C-U>lua require("configs.translate")()<CR>

nnoremap <leader>ttn :Translate NL<CR>
vnoremap <leader>ttn :'<,'>Translate NL<CR>
nnoremap <leader>tte :Translate EN<CR>
vnoremap <leader>tte :'<,'>Translate EN<CR>
nnoremap <leader>ttd :Translate DA<CR>
vnoremap <leader>ttd :'<,'>Translate DA<CR>

let g:translate_menu = {'name': '+Translate',
  \'p': 'Language pick',
  \'n': 'Nederlands',
  \'d': 'Dansk',
  \'e': 'English',
\}

call floggit#update_whichkey('t', {'name': '+Translate', 't': g:translate_menu})

" This is some text here
" Dette er noget tekst her
"Dit is wat tekst hjir
" But this is something different entirely
