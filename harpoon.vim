let g:which_key_map['m'] = {'name': '+Marking',
             \'m': 'view',
             \'j': 'add file',
             \'k': 'goto 1',
             \'l': 'goto 2',
             \';': 'goto 3',
             \'i': 'goto 4',
             \'o': 'goto 5',
             \'p': 'goto 6',
             \}

lua require("harpoon").setup({ menu = { width = vim.api.nvim_win_get_width(0) - 4, } })

nnoremap <silent> <leader>mj :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent> <leader>mm :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent> <leader>mk :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent> <leader>ml :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent> <leader>m; :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent> <leader>mi :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <silent> <leader>mo :lua require("harpoon.ui").nav_file(5)<CR>
nnoremap <silent> <leader>mp :lua require("harpoon.ui").nav_file(6)<CR>
