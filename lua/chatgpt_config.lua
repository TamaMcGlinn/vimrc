require'nvim-gpt'.setup {
  model = 'gpt-3.5-turbo',
  window_width = 65,
  no_default_keymaps = true
  -- see more setup options in section 'Setup options' below
}

vim.api.nvim_command([[
  nnoremap <Leader>ce :Chat completion
  vnoremap <Leader>ce :Chat code_edit
  nnoremap <Leader>cA :Chat question
  vnoremap <Leader>cA :Chat question
]])
-- TODO this one doesn't work, for visual selection and then asking about it: vnoremap <Leader>ca :Chat question

-- uncomment the following for debugging CodeGPT calls to ChatGPT
-- OpenAIApi = require("codegpt.openai_api")
-- function OpenAIApi.make_call(payload, cb)
--   print(vim.inspect(payload))
--   -- and for callback debugging:
--   -- cb({"find . -type f -iname 'Makefile' -maxdepth 4"})
-- end

require("termhelp")
