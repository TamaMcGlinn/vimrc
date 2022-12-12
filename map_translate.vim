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

call floggit#update_whichkey('t', {'name': '+Translate',
      \'t': 'Pick language',
      \'n': 'Nederlands',
   \})
