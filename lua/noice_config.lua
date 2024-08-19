if vim.fn.exists(":Noice") == 1 then
  -- noice plugin is installed
  require("noice").setup({
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      },
    },
    -- you can enable a preset for easier configuration
    presets = {
      bottom_search = true, -- use a classic bottom cmdline for search
      command_palette = true, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false, -- add a border to hover docs and signature help
    },
  })
end

vim.api.nvim_call_function("floggit#update_whichkey", {'n', {
  ['name'] = '+Noice',
  ['l'] = 'Noice last',
  ['h'] = 'Noice history',
  ['E'] = 'Noice errors',
  ['p'] = 'Noice pick',
}})

local ok, noice = pcall(require, 'noice')
if ok then
  noice.setup({
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      },
    },
    -- you can enable a preset for easier configuration
    presets = {
      bottom_search = true, -- use a classic bottom cmdline for search
      command_palette = true, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false, -- add a border to hover docs and signature help
    },
  })

  vim.keymap.set("n", "<leader>nl", function()
    require("noice").cmd("last")
  end)

  vim.keymap.set("n", "<leader>nh", function()
    require("noice").cmd("history")
  end)

  vim.keymap.set("n", "<leader>nE", function()
    require("noice").cmd("errors")
  end)

  vim.keymap.set("n", "<leader>np", function()
    require("noice").cmd("pick")
  end)
end
