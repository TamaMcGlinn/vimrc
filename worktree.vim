lua require("telescope").load_extension("git_worktree")

fu! Create_Worktree() abort
  let l:worktree_name = input('> ')
  " TODO Doesn't work yet
  call nvim_execute_lua('require("git-worktree").create_worktree(l:worktree_name, l:worktree_name)', {})
endfunction

nnoremap <leader>gww :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>

let g:git_worktree_menu = {'name': '+Worktree',
 \'w': 'Switch',
 \}
