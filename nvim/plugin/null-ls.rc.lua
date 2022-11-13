local status, null_ls = pcall(require, "null-ls")

if not status then
    vim.notify("null_ls plugin not found!")
    return
end

null_ls.setup {
    sources = {
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.goimports,
    }
}
