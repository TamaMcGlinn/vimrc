lua require("telescope").load_extension("git_worktree")

fu! Create_Worktree() abort
  lua require('git-worktree')._find_git_root_job()
  let l:worktree_name = input('> ')
  call v:lua.require("git-worktree").create_worktree(l:worktree_name, l:worktree_name)
endfunction

fu! Switch_Worktree() abort
  silent execute 'Gcd'
  lua << EOF
  --local linenr = vim.api.nvim_win_get_cursor(0)[1]
  local Worktree = require("git-worktree")
  Worktree._find_git_root_job()
  require('telescope').extensions.git_worktree.git_worktrees()
  --Worktree.on_tree_update(function(op, metadata)
  --  vim.cmd('execute "normal! ' .. linenr .. 'G"')
  --end)
EOF
endfunction

nnoremap <leader>gww :call Switch_Worktree()<CR>
nnoremap <leader>gwa :call Create_Worktree()<CR>

let g:git_worktree_menu = {'name': '+Worktree',
 \'w': 'Switch',
 \'a': 'Create',
 \}
