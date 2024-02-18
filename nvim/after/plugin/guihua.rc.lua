local status, guihua = pcall(require, "guihua")
if (not status) then
    print("Error loading guihua ")
    return
end

guihua.setup()
