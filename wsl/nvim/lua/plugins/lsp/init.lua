local function on_attach(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")
	require('keymaps').setup(client, bufnr)
end

local servers = {
    "pyright",
--    "sumneko_lua",
    "tsserver",
    "intelephense",
    "html",
}

local lsp = require('lspconfig')
for _, server in pairs(servers) do
    lsp[server].setup{
        on_attach=on_attach
    }
end

