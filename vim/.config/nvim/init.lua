local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
require('packer').startup(function(use)   
  use 'wbthomason/packer.nvim'
  use 'airblade/vim-gitgutter'
  use 'vim-airline/vim-airline'
  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'
  use 'w0rp/ale'
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-sensible'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-repeat'
  use {
    'ms-jpq/chadtree',
    branch = 'chad',
  }
  use {
    'ms-jpq/coq_nvim',
    branch = 'coq',
    config = function ()
      vim.g.coq_settings = {
        display = {
          ["pum.fast_close"] = false,
          ["ghost_text.enabled"] = true,
        },
        auto_start = 'shut-up',
      }
    end
  }
  use 'tjdevries/colorbuddy.nvim'
  use {
    'b3nj5m1n/kommentary',
    config = function ()
      require('kommentary.config').configure_language("default", {
        prefer_single_line_comments = true,
        use_consistent_indentation = true,
        ignore_whitespace = true,
      })
      require('kommentary.config').use_extended_mappings()
      vim.api.nvim_set_keymap('i', '<C-_>', '<esc>gccji', {})
      vim.api.nvim_set_keymap('v', '<C-_>', 'gc<esc>', {})
      vim.api.nvim_set_keymap('n', '<C-_>', 'gccj', {})
    end
  }
  use 'svermeulen/vim-cutlass'
  use {
    'svermeulen/vim-yoink',
    setup = function ()
      vim.g.yoinkIncludeDeleteOperations = 1
    end
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function ()
      require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
      }
    end
  }
  use 'junegunn/fzf.vim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
  vim.opt.listchars = {
    tab = ">-",
    eol = "¬",
    nbsp = "~",
    trail = "•",
    extends = "→",
    precedes = "←",
  }
  vim.wo.list = true
  vim.opt.number = true
  vim.opt.tabstop = 2
  vim.opt.shiftwidth = 2
  vim.opt.softtabstop = 2
  vim.opt.expandtab = true
  vim.opt.completeopt = {'menuone', 'noinsert', 'noselect', 'preview'}
  vim.opt.mouse = 'a'
end)

