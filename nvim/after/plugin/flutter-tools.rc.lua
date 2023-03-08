local status, ftools = pcall(require, 'flutter-tools')
if not status then return end

ftools.setup()
