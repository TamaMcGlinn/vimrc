require("mason").setup {}
require("mason-lspconfig").setup {ensure_installed = {"clangd", "pylsp"}}

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
                                '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
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
local default_servers = {"clangd", "rust_analyzer", "bashls", "vimls", "lua_ls", "omnisharp"}
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
            cs = {{ lintCommand = 'omnisharp' }},
            lua = {{formatCommand = "lua-format -i", formatStdin = true}},
            -- cpp = {
            --     {
            --         lintCommand = 'gccdiag --add-args=\'-S\' --',
            --         lintIgnoreExitCode = true,
            --         lintFormats = {
            --             '%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m',
            --             '%f:%l:%c: %tote: %m'
            --         }
            --     }
            -- },
            arduino = {
              {
                lintCommand = 'cpplint --extensions=ino --filter=-legal/copyright',
                lintFormats = {
                    '%f:%l: %m'
                }
              }
            },
            yaml = {
                {
                    lintCommand = 'yml_lint',
                    lintIgnoreExitCode = true,
                    lintFormats = {
                        '%f:%l: %trror: %m', '%f:%l: %tarning: %m',
                        '%f:%l: %tote: %m'
                    }
                }
            },
            markdown = {
                {
                    lintCommand = 'md_lint.py',
                    lintIgnoreExitCode = true,
                    lintFormats = {
                        '%f:%l: %trror: %m', '%f:%l: %tarning: %m',
                        '%f:%l: %tote: %m'
                    }
                }
            },
            ada = {
                {
                    lintCommand = 'gprbuild_lint',
                    lintIgnoreExitCode = true,
                    lintFormats = {
                        '%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m',
                        '%f:%l:%c: %tote: %m'
                    }
                }, {
                    lintCommand = 'gnatprove_lint',
                    lintIgnoreExitCode = true,
                    lintFormats = {
                        '%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m',
                        '%f:%l:%c: %tote: %m', '%f:%l:%c: %tedium: %m'
                    }
                }, {
                    lintCommand = 'doorstop_reqs_lint',
                    lintIgnoreExitCode = true,
                    lintFormats = {
                        '%f:%l: %trror: %m', '%f:%l: %tarning: %m',
                        '%f:%l: %tote: %m'
                    }
                }
            },
            sh = {
                {
                    lintCommand = 'shellcheck -f gcc -x',
                    lintSource = 'shellcheck',
                    lintFormats = {
                        '%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m',
                        '%f:%l:%c: %tote: %m'
                    },
                    lintIgnoreExitCode = true
                }
            },
            bzl = {
                {
                    lintCommand = 'buildifier --lint=warn \'--warnings=-module-docstring,-function-docstring,-function-docstring-args,-function-docstring-header,-function-docstring-return,+unsorted-dict-items\''
                }
            }
        }
    }
}

require("clangd_extensions").setup({
    inlay_hints = {
        inline = vim.fn.has("nvim-0.10") == 1,
        -- Options other than `highlight' and `priority' only work
        -- if `inline' is disabled
        -- Only show inlay hints for the current line
        only_current_line = false,
        -- Event which triggers a refresh of the inlay hints.
        -- You can make this { "CursorMoved" } or { "CursorMoved,CursorMovedI" } but
        -- not that this may cause  higher CPU usage.
        -- This option is only respected when only_current_line and
        -- autoSetHints both are true.
        only_current_line_autocmd = {"CursorHold"},
        -- whether to show parameter hints with the inlay hints or not
        show_parameter_hints = true,
        -- prefix for parameter hints
        parameter_hints_prefix = "<- ",
        -- prefix for all the other hints (type, chaining)
        other_hints_prefix = "=> ",
        -- whether to align to the length of the longest line in the file
        max_len_align = false,
        -- padding from the left if max_len_align is true
        max_len_align_padding = 1,
        -- whether to align to the extreme right or not
        right_align = false,
        -- padding from the right if right_align is true
        right_align_padding = 7,
        -- The color of the hints
        highlight = "Comment",
        -- The highlight group priority for extmark
        priority = 100
    },
    ast = {
        -- These are unicode, should be available in any font
        role_icons = {
            type = "🄣",
            declaration = "🄓",
            expression = "🄔",
            statement = ";",
            specifier = "🄢",
            ["template argument"] = "🆃"
        },
        kind_icons = {
            Compound = "🄲",
            Recovery = "🅁",
            TranslationUnit = "🅄",
            PackExpansion = "🄿",
            TemplateTypeParm = "🅃",
            TemplateTemplateParm = "🅃",
            TemplateParamObject = "🅃"
        },
        --[[ These require codicons (https://github.com/microsoft/vscode-codicons)
            role_icons = {
                type = "",
                declaration = "",
                expression = "",
                specifier = "",
                statement = "",
                ["template argument"] = "",
            },

            kind_icons = {
                Compound = "",
                Recovery = "",
                TranslationUnit = "",
                PackExpansion = "",
                TemplateTypeParm = "",
                TemplateTemplateParm = "",
                TemplateParamObject = "",
            }, ]]

        highlights = {detail = "Comment"}
    },
    memory_usage = {border = "none"},
    symbol_info = {border = "none"}
})
