local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

local treesitter_parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
treesitter_parser_configs.templ = {
    install_info = {
        url = "https://github.com/vrischmann/tree-sitter-templ.git",
        files = { "src/parser.c", "src/scanner.c" },
        branch = "master",
    },
}

ts.setup {
    highlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
    ensure_installed = {
        "toml",
        "php",
        "swift",
        "yaml",
        "css",
        "go",
        "rust",
        "html",
        "javascript",
        "dart",
        "tsx",
        "json",
        "html",
        "lua"
    },
    autotag = {
        enable = true,
    }
}
vim.treesitter.language.register('templ', 'templ')
