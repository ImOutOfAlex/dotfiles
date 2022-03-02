local g = vim.g
local cmd = vim.cmd
local lsp_installer = require "nvim-lsp-installer"
local lsp = require "lspconfig"
local coq = require "coq"

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}

lsp_installer.on_server_ready(function(server)
  local opts = {}
  server:setup(opts)
end)

-- lsp.<server>.setup(<stuff...>)
-- lsp.<server>.setup(coq.lsp_ensure_capabilities(<stuff...>))
lsp.sumneko_lua.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
}
lsp.sumneko_lua.setup(coq.lsp_ensure_capabilities{})
lsp.pylsp.setup(coq.lsp_ensure_capabilities{})
lsp.bashls.setup(coq.lsp_ensure_capabilities{})
g.coq_settings = {
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
cmd('COQnow -s')
