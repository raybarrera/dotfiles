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

go.setup {
  goimport = "gopls", -- goimports, gopls, or leave empty to use gofmt
  --gofmt = "gopls", --gofmt, goimports, or leave empty to use gofmt
  max_line_len = 120,
  tag_transform = false,
  test_dir = "",
  comment_placeholder = "   ",
  lsp_cfg = false, -- true: apply go.nvim non-default gopls setup
  lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
  lsp_on_attach = false, -- use on_attach from go.nvim
  dap_debug = false, -- set to true to enable dap
  dap_debug_keymap = false, -- set keymaps for debugger
  dap_debug_gui = false, -- set to true to enable dap gui, highly recommanded
  dap_debug_vt = false, -- set to true to enable dap virtual text
}
