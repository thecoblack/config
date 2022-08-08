require('plugins')
require('settings')
require('plugins.telescope')
require('plugins.lsp')
require('nvim-lsp-installer')
require('plugins.nvim-cmp')
require('keymaps')
require('maps')

require('lspconfig')['pyright'].setup{}
