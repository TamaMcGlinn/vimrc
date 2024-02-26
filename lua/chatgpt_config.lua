require'nvim-gpt'.setup {
    model = 'gpt-3.5-turbo',
    window_width = 65,
    no_default_keymaps = true
    -- see more setup options in section 'Setup options' below
}

vim.api.nvim_set_keymap('n', '<leader>ce', ':Chat code_edit ', { noremap = true, silent = true })
