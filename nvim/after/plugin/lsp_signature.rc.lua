local status, lsp_signature = pcall(require, 'lsp_signature')
if not status then
    vim.notify("lsp_signature plugin not found!")
    return
end

lsp_signature.setup{
    bind = true,
    handler_opts = {
        border = "rounded",
    }
}
