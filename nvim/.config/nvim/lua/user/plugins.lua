local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "moll/vim-bbye"  -- Kill a buffer without closing its window
  use "tpope/vim-surround"
  use "tpope/vim-sleuth" -- Detect shiftwidth and expandtab automatically
  use "justinmk/vim-sneak"
  use "tpope/vim-fugitive"
  use "wincent/loupe"  -- Loupe (better search defaults)
  use "machakann/vim-highlightedyank"  -- Highlight the yanked region
  use "rhysd/clever-f.vim"  --  Extended f, F,t and T key mappings
  use "markonm/traces.vim"  -- Range, pattern and substitute preview for Vim
  use "derekwyatt/vim-fswitch"  -- Switch between header and source
  use "RRethy/vim-illuminate" -- Illuminate other uses of the current word under the cursor
  use "tpope/vim-eunuch"  -- Helpers for UNIX (e.g. SudoWrite)
  use "gpanders/editorconfig.nvim"  -- EditorConfig
  use "ellisonleao/gruvbox.nvim"
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "jose-elias-alvarez/null-ls.nvim"
  use "mhinz/vim-startify"

  use {
    "ptzz/lf.vim",
    config = function() vim.g.lf_command_override = 'lf -command "set hidden"' end,
    requires = { 'voldikss/vim-floaterm' }
  }

  use { "nvim-lualine/lualine.nvim", requires = { 'nvim-tree/nvim-web-devicons' } }

  use {'akinsho/bufferline.nvim', tag = "v4.*", requires = 'nvim-tree/nvim-web-devicons'}

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/mason.nvim" -- simple to use language server installer
  use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.1' }

  use { 'nvim-telescope/telescope-media-files.nvim' }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end

   -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use 'HiPhish/nvim-ts-rainbow2'
  use "nvim-treesitter/playground"

  -- Comments
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- NvimTree
  use "nvim-tree/nvim-tree.lua"
end)
