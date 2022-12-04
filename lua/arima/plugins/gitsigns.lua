
-- import gitsigns plugin safely
local setup, gitsigns = pcall(require, "gitsigns")
if not setup then
  return
end

-- configure/enable gitsigns
gitsigns.setup({
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%R %Y-%m-%d> - <summary>',
})
