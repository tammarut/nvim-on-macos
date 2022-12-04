local ok, lualineLib = pcall(require, "lualine")
if not ok then
  return
end

lualineLib.setup()
