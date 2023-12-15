local present, telescope = pcall(require, 'telescope')
if (not present) then return end


local options = {
    defaults = {
        vimgrep_arguments = {
            'rg',
            '-L',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
        },
        file_ignore_patterns = { "node_modules", ".git" },
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        prompt_prefix = " 🔎  ",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                results_width = 0.6,
                preview_width = 0.7,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        initial_mode = "insert",
        winblend = 0,
        border = true,
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
        mappings = {
            n = {
                ["q"] = require('telescope.actions').close
            }
        },
    },
    pickers = {
        lsp_references = {
            theme = "cursor",
            layout_config = {
                width = 0.5,
                height = 0.5,
                preview_width = 0.5,
            },
        },
        lsp_code_actions = {
            theme = "cursor",
            layout_config = {
                width = 0.5,
                height = 0.5,
                preview_width = 0.5,
            },
        },
        diagnostics = {
            theme = "cursor",
        },
    },
    extensions = {
        file_browser = {
            theme = "dropdown",
            hijack_netrw = true,
            hidden = { file_browser = true },
            display_stat = { mode = true },
        },
    },
}

telescope.load_extension("flutter")
local builtin = require('telescope.builtin')
local find = function()
    builtin.find_files({ hidden = false })
end

vim.keymap.set('n', 'ff', find, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})

telescope.setup(options)
telescope.load_extension("file_browser")
vim.keymap.set('n', 'ft', telescope.extensions.file_browser.file_browser, {})
