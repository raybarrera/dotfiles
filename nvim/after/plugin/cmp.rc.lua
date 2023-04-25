local status, cmp = pcall(require, "cmp")
if (not status) then
    vim.notify("cmp plugin not found!")
    return
end

local snip_status,luasnip = pcall(require, "luasnip")
if not snip_status then
    vim.notify("luasnip plugin not found!")
    return
end

require("luasnip.loaders.from_snipmate").lazy_load()

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local select_opts = { behavior = cmp.SelectBehavior.Select }
vim.g.copilot_assume_mapped = true

cmp.setup({
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
        ['<CR>'] = cmp.mapping.confirm({
            select = true,
        }),
        ['<C-b>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                --            elseif luasnip.jumpable(1) then
                --                luasnip.jump(1)
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
                --            elseif luasnip.expandable() then
                --                luasnip.expand()
                --            elseif copilot_keys ~= '' and type(copilot_keys) == 'string' then
                --                vim.api.nvim_feedkeys(copilot_keys, 'i', true)
--            elseif has_words_before() then
--                cmp.complete()
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

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.cmd [[
    highlight! default link CmpItemKind CmpItemMenuDefault
]]
