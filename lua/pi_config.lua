require("pi").setup()

-- Ask pi with the current buffer as context
vim.keymap.set("n", "<leader>cp", ":PiAsk<CR>", { desc = "Ask pi" })

-- Ask pi with visual selection as context
vim.keymap.set("v", "<leader>cp", ":PiAskSelection<CR>", { desc = "Ask pi (selection)" })
