local keymap = vim.keymap

-- Do not yank with x
keymap.set('n', 'x', '"_x"')

-- New Tabs
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w', {silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })
