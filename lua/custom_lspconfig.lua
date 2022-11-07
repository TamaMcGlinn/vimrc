require("nvim-lsp-installer").setup {}

-- Incremental live completion
vim.o.inccommand = 'nosplit'

-- Enable break indent
vim.o.breakindent = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- remove indentation guides
vim.g.indent_blankline_char = ' '

-- Telescope
require('telescope').setup {
    defaults = {mappings = {i = {['<C-u>'] = false, ['<C-d>'] = false}}}
}

-- nvim-cmp setup
local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-u>'] = cmp.mapping.scroll_docs(4),
        ['<C-b>'] = cmp.mapping.scroll_docs(-8),
        ['<C-f>'] = cmp.mapping.scroll_docs(8),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({select = false}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end
    },
    sources = cmp.config.sources({{name = 'nvim_lsp'}, {name = 'ultisnips'}},
                                 {{name = 'buffer'}})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {sources = {{name = 'buffer'}}})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
})

-- LSP settings

local nvim_lsp = require 'lspconfig'
local on_attach = function(_, bufnr)
    local opts = {noremap = true, silent = true}
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD',
                                '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd',
                                '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K',
                                '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi',
                                '<cmd>lua vim.lsp.buf.implementation()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<CS-k>',
                                '<cmd>lua vim.lsp.buf.signature_help()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa',
                                '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr',
                                '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl',
                                '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D',
                                '<cmd>lua vim.lsp.buf.type_definition()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn',
                                '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr',
                                '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca',
                                '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca',
                                '<cmd>lua vim.lsp.buf.range_code_action()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e',
                                '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
                                opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d',
    --                             '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d',
    --                             '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>qo',
                                '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so',
                                [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]],
                                opts)
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local lsp = require('lspconfig')
local util = require('lspconfig.util')

local flake_ignores = {
    "E203", -- whitespace before :
    "W503", -- line break before binary operator
    "E501", -- line too long
    "C901", -- mccabe complexity
    "W293", -- blank line contains whitespace
    "E402" -- module import not at top (covered by pylint instead)
}

lsp.als.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    on_init = require("gpr_selector").als_on_init,
    single_file_support = true,
    root_dir = function() return '/' end
}
lsp.pylsp.setup {
    cmd = {"pylsp"},
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = function(fname) return util.find_git_ancestor(fname) end,
    settings = {
        pylsp = {
            configurationSources = {"pylint"},
            plugins = {
                mccabe = {enabled = false},
                pycodestyle = {enabled = false},
                pydocstyle = {enabled = true},
                pyflakes = {enabled = false},
                mypy = {enabled = false},
                pylint = {enabled = true},
                yapf = {enabled = false},
                rope = {enabled = false},
                flake8 = {
                    enabled = true,
                    ignore = table.concat(flake_ignores, ",")
                }
            }
        }
    }
}

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local default_servers = {
    "clangd", "rust_analyzer", "bashls", "vimls", "sumneko_lua"
}
local settings = {
    init_options = {documentFormatting = false},
    Lua = {
        runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
            -- Setup your lua path
            path = runtime_path
        },
        diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'}
        },
        workspace = {
            checkThirdParty = false,
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true)
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {enable = false}
    }
}

for _, servername in pairs(default_servers) do
    nvim_lsp[servername].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = settings,
        root_dir = nvim_lsp.util.root_pattern('.git')
    }
end

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true -- false will disable the whole extension
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm'
        }
    },
    indent = {enable = true}
}

-- EFM setup
require"lspconfig".efm.setup {
    init_options = {documentFormatting = true},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            bzl = {
                {lintCommand = 'buildifier --lint=warn \'--warnings=-module-docstring,-function-docstring,-function-docstring-args,-function-docstring-header,-function-docstring-return,+unsorted-dict-items\''}
            },
            lua = {
                {formatCommand = "lua-format -i", formatStdin = true},
                {formatCommand = "lua-pretty -i"}
            },
            sh = {
                {
                    lintCommand = 'shellcheck -f gcc -x',
                    lintSource = 'shellcheck',
                    lintFormats = {
                        '%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m',
                        '%f:%l:%c: %tote: %m'
                    }
                }
            }
            -- ada = {
            --     {
            --         lintCommand = 'gprbuild',
            --         lintSource = 'gprbuild',
            --         lintIgnoreExitCode = true,
            --         lintFormats = {
            --             '%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m',
            --             '%f:%l:%c: %tote: %m'
            --         }
            --     }
            -- }
        }
    }
}
