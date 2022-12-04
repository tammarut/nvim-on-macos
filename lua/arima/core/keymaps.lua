-- ━━━━━━━━━━━━━━━━━━━━━━━━━
-- Key mappings
-- ━━━━━━━━━━━━━━━━━━━━━━━━━
vim.g.mapleader = " "

local keymap = vim.keymap -- for coiseness

-- ———————————————————
-- General   
-- ———————————————————
keymap.set("", "<up>", "<nop>")
keymap.set("", "<down>", "<nop>")
keymap.set("", "<left>", "<nop>")
keymap.set("", "<right>", "<nop>")
keymap.set("i", "jk", "<ESC>")
keymap.set("v", "jk", "<ESC>")

-- ▶ Shortcut move to beginning line and end line
keymap.set("n", "E", "$")
keymap.set("n", "B", "^")

-- ▶ Save a file
keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<C-s>", ":w<CR>")

-- ▶ Clear search hightlight
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- ▶ Keep search results at the center of screen
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set("n", "J", "mzJ`z")

-- ▶ Undo break points
keymap.set("i", ",", ",<C-g>u")
keymap.set("i", ".", ".<C-g>u")
keymap.set("i", "!", ".<C-g>u")
keymap.set("i", "?", "?<C-g>u")

-- ▶ Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- ▶ Seleact all
keymap.set("n", "<C-a>", 'gg<S-v>G')

-- —————————————————————————
-- Register (Vim clipboard)
-- —————————————————————————
-- ▶ Delete single characters without updating the default register
keymap.set("n", "x", '"_x')
keymap.set("v", "p", '"_dp')
keymap.set("v", "d", '"_d')


-- ———————————————————————————————
-- Navigate around split windows   
-- ———————————————————————————————
keymap.set("n", "<C-l>", "<C-w><C-l>")
keymap.set("n", "<C-h>", "<C-w><C-h>")
keymap.set("n", "<C-k>", "<C-w><C-k>")
keymap.set("n", "<C-j>", "<C-w><C-j>")

-- ———————————————————————————————
-- Nvim-tree   
-- ———————————————————————————————
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
keymap.set("n", "<A-f>", ":NvimTreeFindFile<CR>")

-- ———————————————————————————————
-- Telescope   
-- ———————————————————————————————
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- Telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]
