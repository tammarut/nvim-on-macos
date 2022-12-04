local ok, _ = pcall(vim.cmd, "colorscheme gruvbox-material")
if not ok then
  print("Colorscheme not found!")
  return
end

vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_palette = "mix"
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_better_performance = 1
