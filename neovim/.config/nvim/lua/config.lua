-- Cutlass and Yoink
require("cutlass").setup({
  cut_key = "m"
})
vim.g.yoinkIncludeDeleteOperations = 1

-- Kommentary
local kommentary = require('kommentary.config')
kommentary.configure_language("default", {
  prefer_single_line_comments = true,
  use_consistent_indentation = true,
  ignore_whitespace = true,
})
kommentary.use_extended_mappings()
vim.api.nvim_set_keymap('i', '<C-_>', '<esc>gccji', {})
vim.api.nvim_set_keymap('v', '<C-_>', 'gc<esc>', {})
vim.api.nvim_set_keymap('n', '<C-_>', 'gccj', {})

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
