lua<<EOF
require("translate").setup({
    default = {
        command = "google",
        output = "replace",
    }
})
EOF

nnoremap <leader>tt :lua require("configs.translate")()<CR>
vnoremap <leader>tt :<C-U>lua require("configs.translate")()<CR>

nnoremap <leader>tn :Translate NL<CR>
vnoremap <leader>tn :<C-U>Translate NL<CR>
nnoremap <leader>te :Translate EN<CR>
vnoremap <leader>te :<C-U>Translate EN<CR>
nnoremap <leader>td :Translate DA<CR>
vnoremap <leader>td :<C-U>Translate DA<CR>

call floggit#update_whichkey('t', {'name': '+Translate',
      \'t': 'Pick language',
      \'n': 'Nederlands',
   \})
