local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
  --'sainnhe/everforest',
  'nvim-treesitter/nvim-treesitter',
  {
    'nvim-telescope/telescope.nvim', tags = '0.1.1', dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {} },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate" -- :MasonUpdate updates registry contents
	},
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'L3MON4D3/LuaSnip',
  'ixru/nvim-markdown',
  'img-paste-devs/img-paste.vim'
}

local opts = {}

require("lazy").setup(plugins, opts)
