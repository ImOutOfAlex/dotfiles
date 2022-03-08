-- aliases
local fn = vim.fn
local api = vim.api
local cmd = vim.cmd

-- imports
local dap = require 'dap'
local dap_install = require 'dap-install'
local dap_ui = require 'dapui'

dap_install.setup {
  installation_path = fn.stdpath("data") .. "/dapinstall/",
}
dap_install.config(
  'python',
  {
    configurations = {
      {
        type = 'python',
        request = 'launch',
        name = 'Launch file',
        program = '${file}',
        pythonPath = 'python',
        args = function()
          local argument_string = fn.input('Program arguments: ')
          return fn.split(argument_string, " ", true)
        end,
      },
      {
        type = 'python',
        request = 'launch',
        name = 'pytest',
        module = 'pytest',
        pythonPath = 'python',
        args = function()
          local argument_string = fn.input('Program arguments: ')
          return table.insert(
            fn.split(argument_string, " ", true),
            0,
            '${file}'
          )
        end,
      },
    },
  }
)

-- TODO: Convert this to use nvim_add_user_command once https://github.com/neovim/neovim/pull/16752 is integrated
cmd("command Debug :lua require'dap'.continue()")
cmd("command StepOver :lua require'dap'.step_over()")
cmd("command StepIn :lua require'dap'.step_into()")
cmd("command StepOut :lua require'dap'.step_out()")
cmd("command ToggleBreakpoint :lua require'dap'.toggle_breakpoint()")
cmd("command SetConditionalBreakpoint :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))")
cmd("command SetBreakpoint :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))")
cmd("command Repl :lua require'dap'.repl.open()")
cmd("command RunLast :lua require'dap'.run_last()")

api.nvim_set_keymap('n', '<F5>', ":Debug<CR>", {})
api.nvim_set_keymap('n', '<F10>', ":StepOver<CR>", {})
api.nvim_set_keymap('n', '<F11>', ":StepInto<CR>", {})
api.nvim_set_keymap('n', '<F12>', ":StepOut<CR>", {})
api.nvim_set_keymap('n', '<leader>b', ":ToggleBreakpoint<CR>", {})
api.nvim_set_keymap('n', '<leader>B', ":SetConditionalBreakpoint<CR>", {})
api.nvim_set_keymap('n', '<leader>lp', ":SetBreakpoint<CR>", {})
api.nvim_set_keymap('n', '<leader>dr', ":Repl<CR>", {})
api.nvim_set_keymap('n', '<leader>dl', ":RunLast<CR>", {})
dap_ui.setup {
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
}
fn.sign_define('DapStopped', {text='▸', texthl='', linehl='', numhl=''})
fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
dap.defaults.fallback.external_terminal = {
  command = '/usr/bin/alacritty';
  args = {'-e'};
}
dap.listeners.after.event_initialized["dapui_config"] = function()
  dap_ui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dap_ui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dap_ui.close()
end
api.nvim_set_keymap('n', '<leader>dd', ":lua require'dapui'.toggle()<CR>", {})

