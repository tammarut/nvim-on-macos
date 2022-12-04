-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was installed


-- Autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
-- vim.cmd([[ 
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
--   augroup end
-- ]])

-- safely import packer
local ok, packer = pcall(require, "packer")
if not ok then
  return
end

return packer.startup(function(use)
  use("wbthomason/packer.nvim")

  use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

  use("sainnhe/gruvbox-material") -- colorscheme

  use("szw/vim-maximizer") -- maximizes and restores current window

  -- ▶ Essential plugins
  use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
  use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

  -- ▶ Commenting with gc
  use("numToStr/Comment.nvim")

  -- ▶ File explorer
  use("nvim-tree/nvim-tree.lua")
  -- ▶ VSCode like icons
  use("nvim-tree/nvim-web-devicons")

  -- Statusline
  use("nvim-lualine/lualine.nvim")

  -- Fuzzy finding w/ telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

  -- Autocompletion
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths

  -- Snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets

  -- Managing & installing LSP servers, Linters & Formatters
  use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

  -- Configuring LSP servers
  -- use("neovim/nvim-lspconfig") -- easily configure language servers
  use{
    "neovim/nvim-lspconfig",
    opt = true,
    event = "BufReadPre",
    wants = { "cmp-nvim-lsp", "null-ls.nvim" },
    requires = {
      "jose-elias-alvarez/null-ls.nvim",
    }
  }
  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
  use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp GUI
  use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

  -- Formatting and Linting
  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })
  use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

  -- Treesitter configuration
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  -- Auto closing
  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

  -- git integration
  use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

  if packer_bootstrap then
    require("packer").sync()
  end
end)

