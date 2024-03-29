local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- core
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'akinsho/toggleterm.nvim'
  use {
    'nvim-neo-tree/neo-tree.nvim', branch = 'v3.x',
    requires = { 'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim' }
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  -- autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'
  -- snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  -- lsp
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'nvimdev/lspsaga.nvim'
  -- misc
  use 'terrortylor/nvim-comment'
  use 'windwp/nvim-autopairs'
  use 'folke/which-key.nvim'
  use 'simrat39/inlay-hints.nvim'
  -- use { 'lukas-reineke/indent-blankline.nvim', main = 'ibl' }
  -- use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
  -- themes
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use { 'folke/tokyonight.nvim', as = 'tokyonight' }
  use { 'shaunsingh/moonlight.nvim', as = 'moonlight' }
  use { 'shaunsingh/nord.nvim', as = 'nord' }
  use { 'loctvl842/monokai-pro.nvim', as = 'monokai' }
  use { 'neanias/everforest-nvim', as = 'everforest' }
  use { 'rose-pine/neovim', as = 'rose-pine' }
  use { 'akinsho/horizon.nvim', as = 'horizon' }
  use { 'rebelot/kanagawa.nvim', as = 'kanagawa' }
  use { 'marko-cerovac/material.nvim', as = 'material' }
  use { 'Shatur/neovim-ayu', as = 'ayu' }
  use { 'fenetikm/falcon', as = 'falcon' }
  use { 'akai54/2077.nvim', as = '2077' }
  use { 'projekt0n/github-nvim-theme', as = 'github' }
  -- configs
  require 'core.plugins.lualine'
  require 'core.plugins.tree'
  require 'core.plugins.telescope'
  require 'core.plugins.treesitter'
  require 'core.plugins.term'
  require 'core.plugins.cmp'
  require 'core.plugins.lsp'
  require 'core.plugins.misc'
  -- autosetup
  if packer_bootstrap then
    require('packer').sync()
  end
end)
