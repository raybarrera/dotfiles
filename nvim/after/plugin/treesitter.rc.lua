local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
    highlight = {
        enable = true,
        use_languagetree = true,
    },
    indent = {
        enable = true,
    },
    ensure_installed = {
        "go",
        "tsx",
        "json",
        "html",
        "lua"
    },
    autotag = {
        enable = true,
    }
}

