require('plugins')
require('settings')
require('plugins.telescope')
require('plugins.lsp')
require('nvim-lsp-installer')
require('plugins.nvim-cmp')
require('keymaps')
require('maps')

local lsp = require('lspconfig')
lsp.pyright.setup{}
lsp.jedi_language_server.setup{}
lsp.sumneko_lua.setup{}
lsp.tsserver.setup{}
lsp.cssls.setup{}
lsp.intelephense.setup{}
lsp.html.setup{}
