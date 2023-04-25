local status, ls = pcall(require, "luasnip")
if (not status) then return end

ls.config.set_config({
    history = true,
    enable_autosnippets = true,
    updateevents = "TextChanged,TextChangedI",
})

-- require("luasnip.loaders.from_snipmate").lazy_load()
-- require("luasnip.loaders.from_vscode").lazy_load()
