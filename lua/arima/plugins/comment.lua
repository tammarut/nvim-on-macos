local ok, commentLib = pcall(require, "Comment")
if not ok then
  return
end

commentLib.setup()
