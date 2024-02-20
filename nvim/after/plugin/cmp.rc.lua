local status, cmp = pcall(require, "cmp")
if (not status) then
    vim.notify("cmp plugin not found!")
    return
end

local snip_status, luasnip = pcall(require, "luasnip")
if not snip_status then
    vim.notify("luasnip plugin not found!")
    return
end

local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
    vim.notify("lspkind plugin not found!")
    return
end

require("luasnip.loaders.from_snipmate").lazy_load()

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match('^%s*$') == nil
end

local select_opts = { behavior = cmp.SelectBehavior.Insert }

cmp.setup({
    completion = {
        completeopt = 'menu,menuone',
    },
    experimental = {
        ghost_text = true,
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 150,
            ellipsis_char = '…',
            show_labelDetails = true,
            symbol_map = { Copilot = "" },
            before = function(_, vim_item)
                return vim_item
            end,
        }),
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        documentation = {
            border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
            winhighlight = 'NormalFloat:CmpDoc',
        },
        completion = {
            border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
            winhighlight = 'NormalFloat:CmpItemMenu,FloatBorder:CmpItemMenu',
        },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
        ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping(cmp.mapping.confirm({
            select = true,
        }), { 'i', 's' }),
        ['<C-b>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<Tab>'] = vim.schedule_wrap(function(fallback)
            if cmp.visible() and has_words_before() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' })
    }),
    sources = {
        { name = 'copilot' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users
        { name = 'buffer' },
        { name = 'nvim_lua' },
        { name = 'path' },
        { name = 'nvim_lsp_signature_help' },
    },
})

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
    },
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({ { name = 'path' }, { name = 'cmdline' } }),
})

-- vim.opt.completeopt = { 'menu', 'menuone' }
-- vim.cmd [[
--highlight! default link CmpItemKind CmpItemMenuDefault
--]]
