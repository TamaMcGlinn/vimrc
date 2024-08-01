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
  system_clipboard = {sync_with_ring = false},
  highlight = {on_put = false, on_yank = true, timer = 100},
  preserve_cursor_position = {enabled = true},
  textobj = {enabled = true}
})

vim.keymap.set({"n", "x"}, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({"n", "x"}, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({"n", "x"}, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({"n", "x"}, "gP", "<Plug>(YankyGPutBefore)")

-- note 'forward' and 'backward' are the reverse of what I was used to from YankRing.vim
vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleForward)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleBackward)")

vim.keymap.set("n", "]p", "<Plug>(YankyPutIndentAfterLinewise)", {})
vim.keymap.set("n", "[p", "<Plug>(YankyPutIndentBeforeLinewise)", {})
vim.keymap.set("n", "]P", "<Plug>(YankyPutIndentAfterLinewise)", {})
vim.keymap.set("n", "[P", "<Plug>(YankyPutIndentBeforeLinewise)", {})

vim.keymap.set("n", ">p", "<Plug>(YankyPutIndentAfterShiftRight)", {})
vim.keymap.set("n", "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", {})
vim.keymap.set("n", ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", {})
vim.keymap.set("n", "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", {})

vim.keymap.set("n", "=p", "<Plug>(YankyPutAfterFilter)", {})
vim.keymap.set("n", "=P", "<Plug>(YankyPutBeforeFilter)", {})
