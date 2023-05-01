local status, bufferline = pcall(require, 'bufferline')

if (not status) then
    print("bufferline is not installed")
    return
end

vim.opt.termguicolors = true

bufferline.setup {
    options = {
        numbers = "ordinal",
        color_icons = true,
        hover = {
            enable = true,
            delay = 200,
            reveal = {'close'},
        },
        indicator = {
            style = "underline",
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
        show_buffer_close_icons = false,
        separator_style = "thin",
        close_icon = "",
        buffer_close_icon = "",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
    }
}
