local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path})
end
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }
  use 'windwp/windline.nvim'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }
  use 'jiangmiao/auto-pairs'  -- vimscript
  use 'tpope/vim-vinegar'  -- vimscript
  use 'tpope/vim-repeat'  -- vimscript
  use {
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap", },
  }
  use {
    'Pocco81/DAPInstall.nvim',
    requires = { 'jbyuki/one-small-step-for-vimkind' }
  }
  use {
    'rcarriga/vim-ultest',
    requires = 'vim-test/vim-test',
    run = ':UpdateRemotePlugins'
  }
  use {
    'ms-jpq/coq_nvim',
    requires = {
      'ms-jpq/coq.artifacts'
    },
    branch = 'coq'
  }
  use {
    'ms-jpq/chadtree',
    branch = 'chad',
  }
  use {
    'romgrk/barbar.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }
  use 'b3nj5m1n/kommentary'
  use 'gbprod/cutlass.nvim'
  use 'svermeulen/vim-yoink'  -- vimscript
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use 'junegunn/fzf.vim'  -- vimscript

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
