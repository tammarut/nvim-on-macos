local opt = vim.opt -- for conciseness

-- ———————————————————
-- General   
-- ———————————————————
opt.timeoutlen = 500 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.ttimeoutlen = 80
opt.updatetime = 300 -- faster completion
opt.redrawtime = 1500
opt.fillchars = {
	vert = "▕", -- alternatives │
	fold = " ",
	eob = " ", -- suppress ~ at EndOfBuffer
	diff = "╱", -- alternatives = ⣿ ░ ─
	msgsep = "‾",
	foldopen = "▾",
	foldsep = "│",
	foldclose = "▸",
}

opt.autoread = true
opt.confirm = true
opt.wildignore = {
	"*.aux,*.out,*.toc",
	"*.o,*.obj,*.dll,*.jar,*.pyc,__pycache__,*.rbc,*.class",
	-- media
	"*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp",
	"*.avi,*.m4a,*.mp3,*.oga,*.ogg,*.wav,*.webm",
	"*.eot,*.otf,*.ttf,*.woff",
	"*.doc,*.pdf",
	-- archives
	"*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz",
	-- temp/system
	"*.*~,*~ ",
	"*.swp,.lock,.DS_Store,._*,tags.lock",
	-- version control
	".git,.svn",
}

-- ▶ Line numbers
opt.relativenumber = true
opt.number = true

-- ▶ Tab and Indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true -- make indenting smarter again


-- ▶ Line wrap
opt.wrap = false

-- ▶ Search settings
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true -- highlight all matches on previous search pattern

-- ▶ Cursor line
opt.cursorline = true
opt.backspace = "indent,eol,start"

-- ▶ Appearance
opt.termguicolors = true
opt.signcolumn = "yes"
opt.mouse = "a" -- allow the mouse to be used in neovim

-- ▶ Clipboard
opt.clipboard:append("unnamedplus")

-- ▶ Windows
opt.splitright = true
opt.splitbelow = true
opt.title = true -- set the title of window to the value of the titlestring
opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to


opt.iskeyword:append("-")

opt.syntax = 'on'
opt.hidden = true -- required to keep multiple buffers and open multiple buffers
opt.backup = false -- creates a backup file
opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
opt.colorcolumn = "99999" -- fixes indentline for now
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.fileencoding = "utf-8" -- the encoding written to a file
opt.swapfile = false -- creates a swapfile
opt.undodir = vim.fn.stdpath "cache" .. "/undo"
opt.undofile = true -- enable persistent undo
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
opt.spell = false
opt.spelllang = "en"
opt.scrolloff = 8 -- is one of my fav
opt.sidescrolloff = 8

-- ———————————————————
-- Fold   
-- ———————————————————
vim.opt.foldmethod = "indent"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 99
vim.o.foldlevel = 4
vim.o.foldminlines = 1
vim.o.foldnestmax = 3

vim.cmd([[ 
  autocmd VimResized * wincmd =  -- Automatically equalize splits when Vim is resized
]])

