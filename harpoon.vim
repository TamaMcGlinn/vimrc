let g:which_key_map['m'] = {'name': '+Marking',
             \'m': 'view',
             \'j': 'add file',
             \}

nnoremap <leader>mj :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>mm :lua require("harpoon.ui").toggle_quick_menu()<CR>
