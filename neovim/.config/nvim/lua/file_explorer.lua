local api = vim.api
api.nvim_set_keymap('n', '-', '<cmd>CHADopen<cr>', {})
api.nvim_set_var("chadtree_settings", {
  keymap = {
    quit = {'-'},
    smaller = {'_'},
  },
})
