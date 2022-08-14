local function on_attach(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")
	require('keymaps').setup(client, bufnr)
end

-- local opts = {
--     on_attach = on_attach,
--     flags = {
--         debounce_text_changes=150,
--     },
-- }

local servers = {
    "pyright",
    "sumneko_lua",
    "tsserver",
    "intelephense",
    "html"
}

local lsp = require('lspconfig')
for _, server in pairs(servers) do
    lsp[server].setup{
        on_attach=on_attach
    }
end

-- cssls autocompletation
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSuport = true

require('lspconfig')['cssls'].setup({
    capabilities=capabilities,
    cmd={'css-languageserver', '--stdio'},
})


--lsp.pyright.setup{}
--lsp.jedi_language_server.setup{}
--lsp.sumneko_lua.setup{}
--lsp.tsserver.setup{}
--lsp.cssls.setup{}
--lsp.intelephense.setup{}
--lsp.html.setup{}

