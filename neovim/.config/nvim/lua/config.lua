-- Aliases
local g = vim.g
local wo = vim.wo
local opt = vim.opt
local api = vim.api

-- Cutlass and Yoink
require("cutlass").setup({
  cut_key = "m"
})
g.yoinkIncludeDeleteOperations = 1

-- Kommentary
local kommentary = require('kommentary.config')
kommentary.configure_language("default", {
  prefer_single_line_comments = true,
  use_consistent_indentation = true,
  ignore_whitespace = true,
})
kommentary.use_extended_mappings()
api.nvim_set_keymap('i', '<C-_>', '<esc>gccji', {})
api.nvim_set_keymap('v', '<C-_>', 'gc<esc>', {})
api.nvim_set_keymap('n', '<C-_>', 'gccj', {})

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
opt.listchars = {
  tab = ">-",
  eol = "¬",
  nbsp = "~",
  trail = "•",
  extends = "→",
  precedes = "←",
}
wo.list = true
opt.number = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.completeopt = {'menuone', 'noinsert', 'noselect', 'preview'}
opt.mouse = 'a'
