local function on_attach(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")
	require('keymaps').setup(client, bufnr)
end

local opts = {
	on_attach = on_attach,
	flags = {
		debounce_text_changes=150,
	},
}


