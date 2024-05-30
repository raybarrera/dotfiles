local status, lualine = pcall(require, "lualine")
if (not status) then return end

local colors = {
    bg       = '#202328',
    fg       = '#bbc2cf',
    yellow   = '#ECBE7B',
    cyan     = '#008080',
    darkblue = '#081633',
    green    = '#98be65',
    orange   = '#FF8800',
    violet   = '#a9a1e1',
    magenta  = '#c678dd',
    blue     = '#51afef',
    red      = '#ec5f67',
}

lualine.setup {
    options = {
        theme = "material",
        component_separators = '',
    },
    sections = {
        lualine_b = {
            {
                'branch',
                icon = '',
                color = { bg = colors.bg, fg = colors.violet, gui = 'bold' },
            },
            {
                'diff',
                symbols = { added = ' ', modified = ' ', removed = ' ' },
                color = { bg = colors.bg, gui = 'bold' },
                diff_color = {
                    added = { fg = colors.green },
                    modified = { fg = colors.orange },
                    removed = { fg = colors.red },
                },
            },
        },
        lualine_c = {
            {
                "filename",
                right_padding = 1,
                path = 1,
                newfile_status = true,
                color = { bg = '#202328', },
            }
        },
        lualine_x = {
            {
                -- Lsp server name .
                function()
                    local msg = 'No Active Lsp'
                    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                    local clients = vim.lsp.get_active_clients()
                    if next(clients) == nil then
                        return msg
                    end
                    for _, client in ipairs(clients) do
                        local filetypes = client.config.filetypes
                        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                            return client.name
                        end
                    end
                    return msg
                end,
                icon = ' LSP:',
                color = { fg = '#ffffff', gui = 'bold' },
            },
            { 'encoding', },
            {
                'fileformat',
                fmt = string.upper,
            },
            { 'filetype', }
        },
        lualine_y = {
            {
                'diagnostics',
                sources = { 'nvim_diagnostic' },
                symbols = { error = ' ', warn = ' ', info = ' ' },
            },
        },
    }
}
