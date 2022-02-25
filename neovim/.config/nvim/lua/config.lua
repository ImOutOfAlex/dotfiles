-- Treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}

-- Cutlass and Yoink
require("cutlass").setup({
  cut_key = "m"
})
vim.g.yoinkIncludeDeleteOperations = 1

-- Kommentary
require('kommentary.config').configure_language("default", {
  prefer_single_line_comments = true,
  use_consistent_indentation = true,
  ignore_whitespace = true,
})
require('kommentary.config').use_extended_mappings()
vim.api.nvim_set_keymap('i', '<C-_>', '<esc>gccji', {})
vim.api.nvim_set_keymap('v', '<C-_>', 'gc<esc>', {})
vim.api.nvim_set_keymap('n', '<C-_>', 'gccj', {})


-- COQ
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


-- Tree View
vim.api.nvim_set_keymap('n', '-', '<cmd>CHADopen<cr>', {})
vim.api.nvim_set_var("chadtree_settings", {
  keymap = {
    quit = {'-'},
    smaller = {'_'},
  },
})

-- LSP
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
  local opts = {}
  server:setup(opts)
end)

-- DAP
require("dap-install").setup({
  installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
})
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

-- Windline
require('wlsample.wind')

-- gitsigns
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
