vim.api.nvim_create_autocmd('DiagnosticChanged', {
  callback = function(args)
    local diagnostics = args.data.diagnostics
    if #diagnostics == 0 then return end

    local diagnostic_namespace = 0
    -- deduplicate diagnostics list
    local unique_diagnostics = {}
    local seen = {}
    for _, item in ipairs(diagnostics) do
      diagnostic_namespace = item.namespace
      local item_string = item.lnum .. item.message
      if not seen[item_string] then
        seen[item_string] = true
        -- vim.pretty_print("first: " .. item.message)
        unique_diagnostics[#unique_diagnostics + 1] = item
      end
    end

    -- vim.pretty_print(diagnostics)
    -- vim.pretty_print("unduplicated: " .. #unique_diagnostics)
    if #unique_diagnostics < #diagnostics then
      local bufnr = vim.api.nvim_get_current_buf()
      vim.diagnostic.reset(diagnostic_namespace, bufnr)
      vim.diagnostic.set(diagnostic_namespace, bufnr, unique_diagnostics)
    end
  end
})
