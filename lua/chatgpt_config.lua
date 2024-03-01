require'nvim-gpt'.setup {
    model = 'gpt-3.5-turbo',
    window_width = 65,
    no_default_keymaps = true
    -- see more setup options in section 'Setup options' below
}

vim.api.nvim_set_keymap('n', '<leader>ce', ':Chat completion ', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ca', ':Chat question ', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>ce', "'<,'>:Chat code_edit ", { noremap = true, silent = true })


-- when trying to use this in a terminal window, I got this error:

-- Error executing vim.schedule lua callback: /home/tama/.vim/plugged/CodeGPT.nvim/lua/codegpt/utils.lua:52: Buffer is not 'modifiable'                                                                        
-- stack traceback:
--         [C]: in function 'nvim_buf_set_text'
--         /home/tama/.vim/plugged/CodeGPT.nvim/lua/codegpt/utils.lua:52: in function 'replace_lines'
--         .../.vim/plugged/CodeGPT.nvim/lua/codegpt/commands_list.lua:29: in function 'callback'
--         .../tama/.vim/plugged/CodeGPT.nvim/lua/codegpt/commands.lua:21: in function 'cb'
--         ...im/plugged/CodeGPT.nvim/lua/codegpt/providers/openai.lua:85: in function 'handle_response'
--         ...ama/.vim/plugged/CodeGPT.nvim/lua/codegpt/openai_api.lua:55: in function ''
--         vim/_editor.lua: in function <vim/_editor.lua:0>
--
-- now I'm trying to create my own callback that works for the terminal

-- note I can also use {{text_selection}}

-- require("codegpt.config")

-- vim.g["codegpt_commands"] = {
-- }

-- uncomment the following for debugging CodeGPT calls to ChatGPT
-- OpenAIApi = require("codegpt.openai_api")
-- function OpenAIApi.make_call(payload, cb)
--   print(vim.inspect(payload))
--   -- and for callback debugging:
--   -- cb({"find . -type f -iname 'Makefile' -maxdepth 4"})
-- end

require("termhelp")
