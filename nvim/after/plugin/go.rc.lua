local status, go = pcall(require, "go")

if (not status) then
    print("Error loading go: ")
    return
end

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        require("go.format").goimport()
    end,
    group = format_sync_grp
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

go.setup {
    goimport = "gopls", -- goimports, gopls, or leave empty to use gofmt
    gofmt = "gofumpt", --gofmt, goimports, or leave empty to use gofmt
    fillstruct = "gopls", --gopls, or leave empty to use gopls
    max_line_len = 120,
    tag_transform = false,
    test_dir = "",
    comment_placeholder = "   ",
    lsp_cfg = true, -- true: apply go.nvim non-default gopls setup
    lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
    lsp_on_attach = on_attach, -- use on_attach from go.nvim
    lsp_keymaps = false, -- true: apply go.nvim keymaps
    lsp_codelens = true, -- set to false to disable codelens, true by default
    dap_debug = false, -- set to true to enable dap
    dap_debug_keymap = false, -- set keymaps for debugger
    dap_debug_gui = false, -- set to true to enable dap gui, highly recommanded
    dap_debug_vt = false, -- set to true to enable dap virtual text
    luasnip = true, -- set to true to enable luasnip
}
