vim.api.nvim_set_keymap('n', '-', '<cmd>CHADopen<cr>', {})
vim.api.nvim_set_var("chadtree_settings", {
  keymap = {
    quit = {'-'},
    smaller = {'_'},
  },
})
