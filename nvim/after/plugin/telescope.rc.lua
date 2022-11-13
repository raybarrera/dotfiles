local present, telescope = pcall(require, 'telescope')
if (not present) then return end


local options = {
    defaults = {
        sorting_strategy = "ascending",
        prompt_prefix = "   ",
        layout_strategy = "horizontal",
        winblend = 0,
        borer = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    }
}

local builtin = require('telescope.builtin')

vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})

telescope.setup(options)
