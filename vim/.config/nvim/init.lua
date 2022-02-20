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
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function ()
      require('gitsigns').setup {
        signs = {
          add = {
            hl = 'GitSignsAdd',
            text = '+',
            numhl='GitSignsAddNr',
            linehl='GitSignsAddLn',
          },
          change = {
            hl = 'GitSignsChange',
            text = '~',
            numhl='GitSignsChangeNr',
            linehl='GitSignsChangeLn',
          },
          delete = {
            hl = 'GitSignsDelete',
            text = '_',
            numhl='GitSignsDeleteNr',
            linehl='GitSignsDeleteLn',
          },
          topdelete = {
            hl = 'GitSignsDelete',
            text = '‾',
            numhl='GitSignsDeleteNr',
            linehl='GitSignsDeleteLn',
          },
          changedelete = {
            hl = 'GitSignsChange',
            text = '~',
            numhl='GitSignsChangeNr',
            linehl='GitSignsChangeLn',
          },
        },
      }
    end
  }
  use {
    'windwp/windline.nvim',
    config = function ()
      require('wlsample.wind')
    end
  }
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'w0rp/ale'
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-repeat'
  use {
    'ms-jpq/chadtree',
    branch = 'chad',
    config = function ()
      vim.api.nvim_set_keymap('n', '-', '<cmd>CHADopen<cr>', {})
      vim.api.nvim_set_var("chadtree_settings", {
        keymap = {
          quit = {'-'},
          smaller = {'_'},
        },
      })
    end
  }
  use {
    'ms-jpq/coq_nvim',
    requires = {
      'ms-jpq/coq.artifacts'
    },
    branch = 'coq',
    config = function ()
      local lsp = require "lspconfig"
      local coq = require "coq" -- add this

      -- lsp.<server>.setup(<stuff...>)
      -- lsp.<server>.setup(coq.lsp_ensure_capabilities(<stuff...>))
      lsp.pylsp.setup(coq.lsp_ensure_capabilities{})
      -- lsp.sumneko_lua.setup(coq.lsp_ensure_capabilities{})
      lsp.bashls.setup(coq.lsp_ensure_capabilities{})
      vim.g.coq_settings = {
        display = {
          ["pum.fast_close"] = false,
          ["ghost_text.enabled"] = true,
        },
        clients = {
          ["tree_sitter.enabled"] = true,
          ["lsp.enabled"] = true,
        },
        auto_start = 'shut-up',
      }
      -- Remove this once I figure out how...
      vim.cmd('COQnow -s')
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

  -- My custom configuration
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

