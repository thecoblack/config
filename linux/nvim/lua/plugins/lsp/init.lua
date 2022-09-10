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
    "html",
    "gopls",
    "vimls",
    "ccls",
    "cssls"
}

local lsp = require('lspconfig')
for _, server in pairs(servers) do
    lsp[server].setup{
        on_attach=on_attach
    }
end

lsp.tsserver.setup {
    on_attach=on_attach,
    filetypes={"typescript", "typescriptreact", "typescript.tsx"},
    cmd={"typescript-language-server", "--stdio"}
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSuport = true

lsp.cssls.setup {
    capabilities=capabilities,
    cmd={'vscode-css-language-server', '--stdio'},

}

-- cssls autocompletation

-- require('lspconfig')['cssls'].setup({
--     -- capabilities=capabilities,
--     cmd={'vscode-css-language-server', '--stdio'},
-- })

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.setup({
    automatic_installation = false,
})
