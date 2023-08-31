return {
    'nvim-treesitter/nvim-treesitter',
    requires = {'nvim-treesitter/nvim-treesitter-textobjects'},
    run = function()
        require('nvim-treesitter.install').update({with_sync = true})
    end,
    config = function()

        --  Add support for our Ada parser

        local parsers = require "nvim-treesitter.parsers"
        local parser_config = parsers.get_parser_configs()
        parser_config.ada = {
            install_info = {
                url = "https://github.com/briot/tree-sitter-ada",
                files = {"src/parser.c"},
                generate_requires_npm = false,
                requires_generate_from_grammar = false
            },
            filetype = "ada"
        }
    end
}
