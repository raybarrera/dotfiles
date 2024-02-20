local status, copilot = pcall(require, "copilot")
if (not status) then
    vim.notify("copilot plugin not found!")
    return
end

local found, copilot_cmp = pcall(require, "copilot_cmp")
if (not found) then
    vim.notify("copilot_cmp plugin not found!")
    return
end

copilot.setup({
    auto_refresh = true,
    suggestion = { enabled = false },
    panel = { enabled = false }
})
copilot_cmp.setup({
})
