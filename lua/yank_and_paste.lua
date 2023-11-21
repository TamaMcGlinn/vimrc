require("yanky").setup({
    ring = {
        history_length = 100,
        storage = "shada",
        storage_path = vim.fn.stdpath("data") .. "/databases/yanky.db", -- Only for sqlite storage
        sync_with_numbered_registers = true,
        cancel_event = "update",
        ignore_registers = {"_"},
        update_register_on_cycle = false
    },
    picker = {
        select = {
            action = nil -- nil to use default put action
        },
        telescope = {
            use_default_mappings = true, -- if default mappings should be used
            mappings = nil -- nil to use default mappings or no mappings (see `use_default_mappings`)
        }
    },
    system_clipboard = {sync_with_ring = true},
    highlight = {on_put = false, on_yank = true, timer = 100},
    preserve_cursor_position = {enabled = true},
    textobj = {enabled = true}
})

vim.keymap.set({"n", "x"}, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({"n", "x"}, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({"n", "x"}, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({"n", "x"}, "gP", "<Plug>(YankyGPutBefore)")

vim.keymap.set({"n", "x"}, "p", "<Plug>(YankyPutAfter)")
