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
  use {
    'williamboman/nvim-lsp-installer',
    config = function()
      local lsp_installer = require("nvim-lsp-installer")
      lsp_installer.on_server_ready(function(server)
        local opts = {}
        server:setup(opts)
      end)
    end
  }
  use 'jiangmiao/auto-pairs'  -- vimscript
  use 'tpope/vim-vinegar'  -- vimscript
  use 'tpope/vim-fugitive'  -- vimscript
  use 'tpope/vim-repeat'  -- vimscript
  use 'jbyuki/one-small-step-for-vimkind'
  use 'mfussenegger/nvim-dap'
  use {
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap", },
    config = function ()
      require("dapui").setup({
        icons = { expanded = "▾", collapsed = "▸" },
        sidebar = {
          -- You can change the order of elements in the sidebar
          elements = {
            -- Provide as ID strings or tables with "id" and "size" keys
            {
              id = "scopes",
              size = 0.25, -- Can be float or integer > 1
            },
            { id = "breakpoints", size = 0.25 },
            { id = "stacks", size = 0.25 },
            { id = "watches", size = 00.25 },
          },
          size = 40,
          position = "left", -- Can be "left", "right", "top", "bottom"
        },
        tray = {
          elements = { "repl" },
          size = 10,
          position = "bottom", -- Can be "left", "right", "top", "bottom"
        },
        floating = {
          max_height = nil, -- These can be integers or a float between 0 and 1.
          max_width = nil, -- Floats will be treated as percentage of your screen.
          border = "single", -- Border style. Can be "single", "double" or "rounded"
          mappings = {
            close = { "q", "<Esc>" },
          },
        },
        windows = { indent = 1 },
      })
    end
  }
  use {
    "Pocco81/DAPInstall.nvim",
    config = function ()
      require("dap-install").setup({
        installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
      })
    end
  }
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
      local coq = require "coq"

      -- lsp.<server>.setup(<stuff...>)
      -- lsp.<server>.setup(coq.lsp_ensure_capabilities(<stuff...>))
      lsp.pylsp.setup(coq.lsp_ensure_capabilities{})
      lsp.sumneko_lua.setup(coq.lsp_ensure_capabilities {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            }
          },
        },
      })
      lsp.bashls.setup(coq.lsp_ensure_capabilities{})
      vim.g.coq_settings = {
        display = {
          ["pum.fast_close"] = false,
          ["ghost_text.enabled"] = true,
          ["preview.border"] = 'shadow',
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
  use {
    "gbprod/cutlass.nvim",
    config = function()
      require("cutlass").setup({
          cut_key = "m"
      })
    end
  }
  use {
    'svermeulen/vim-yoink',  -- vimscript
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
  use 'junegunn/fzf.vim'  -- vimscript

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

