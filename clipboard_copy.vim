vim.keymap.set("v", "<leader>cp", '<cmd>lua require("osc52").copy_visual()<CR>', { desc = "Copy (to clipboard)" })

lua <<EOF
vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}
EOF

let g:go_copy_menu = {'name': '+Things',
      \'f': 'relative filename',
      \}

call floggit#update_whichkey('c', {'name': '+Copy',
      \'p': 'copy to clipboard',
      \'g': g:go_copy_menu
 \})

