local status, nvimtree = pcall(require, "nvim-tree")
if (not status) then return end

nvimtree.setup({
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = true,
    view = {
        adaptive_size = false,
        side = "left",
        width = 30,
        preserve_window_proportions = true,
    },
    git = {
        enable = false,
        ignore = true,
    },
    filesystem_watchers = {
        enable = true,
    },
    filters = {
        dotfiles = false,
    },
})

vim.keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })
