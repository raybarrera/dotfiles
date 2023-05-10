local status, bufferline = pcall(require, 'bufferline')

if (not status) then
    print("bufferline is not installed")
    return
end

vim.opt.termguicolors = true
bufferline.setup {
    options = {
        numbers = "ordinal",
        style_preset = bufferline.style_preset.no_italic,
        color_icons = true,
        hover = {
            enabled = true,
            delay = 100,
            reveal = {'close'},
        },
        indicator = {
            style = "icon",
        },
        diagnostics = "nvim_lsp",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left",
                padding = 1,
            }
        },
        show_close_icon = false,
        show_buffer_close_icons = true,
        separator_style = "thin",
        close_icon = "",
        buffer_close_icon = "",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
    }
}

vim.keymap.set('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>4', '<cmd>BufferLineGoToBuffer 4<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>5', '<cmd>BufferLineGoToBuffer 5<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>6', '<cmd>BufferLineGoToBuffer 6<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>7', '<cmd>BufferLineGoToBuffer 7<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>8', '<cmd>BufferLineGoToBuffer 8<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>9', '<cmd>BufferLineGoToBuffer 9<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>0', '<cmd>BufferLineGoToBuffer 10<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>$', '<cmd>BufferLineGoToBuffer -1<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '[b', '<cmd>BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', ']b', '<cmd>BufferLineCycleNext<CR>', { noremap = true, silent = true })
