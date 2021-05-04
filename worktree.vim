lua require("telescope").load_extension("git_worktree")

fu! Create_Worktree() abort
  let l:worktree_name = input('> ')
  " TODO Doesn't work yet
  call nvim_execute_lua('require("git-worktree").create_worktree(l:worktree_name, l:worktree_name)', {})
endfunction

fu! Switch_Worktree() abort
  lua require('git-worktree')._find_git_root_job()
  lua require('telescope').extensions.git_worktree.git_worktrees()
endfunction

nnoremap <leader>gww :call Switch_Worktree()<CR>

let g:git_worktree_menu = {'name': '+Worktree',
 \'w': 'Switch',
 \}
