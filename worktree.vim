lua require("telescope").load_extension("git_worktree")

fu! Create_Worktree() abort
  lua require('git-worktree')._find_git_root_job()
  let l:worktree_name = input('> ')
  call v:lua.require("git-worktree").create_worktree(l:worktree_name, l:worktree_name)
endfunction

fu! Switch_Worktree() abort
  lua require('git-worktree')._find_git_root_job()
  lua require('telescope').extensions.git_worktree.git_worktrees()
endfunction

nnoremap <leader>gww :call Switch_Worktree()<CR>
nnoremap <leader>gwa :call Create_Worktree()<CR>

let g:git_worktree_menu = {'name': '+Worktree',
 \'w': 'Switch',
 \'a': 'Create',
 \}
