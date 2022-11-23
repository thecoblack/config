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
    "yamlls",
    "dockerls",
}

local lsp = require('lspconfig')
for _, server in pairs(servers) do
    lsp[server].setup{
        on_attach=on_attach
    }
end


local capabilities = vim.lsp.protocol.make_client_capabilities()
local css_capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

lsp.cssls.setup {
    capabilities=css_capabilities,
}

capabilities.textDocument.completion.completionItem.snippetSupport = true
lsp.html.setup {
    init_options={
        configurationSection = { "html", "css", "javascript" },
        embeddedLanguages = {
            css = true,
            javascript = true,
        },
        provideFormatter = true,
    },
}
