local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<leader>f", ":Telescope find_files<CR>", nil)
map("n", "<leader>b", ":Telescope buffers<CR>", nil)
map("n", "<leader>`", ":Telescope project<CR>", nil)
map("n", "<leader>t", ":Telescope<CR>", nil)

-- NERDCommenter

map("v", "<C-;>", "<cmd>NERDCommenterToggle<CR>", nil)

-- Tree
map("n", "<leader>n", ':NvimTreeToggle<CR>', nil)

-- Bufferline



-- harpoon

map("n", "<leader>z", ':lua require("harpoon.mark").add_file()<CR>', nil)
map("n", "<leader>l", ':lua require("harpoon.ui").toggle_quick_menu()<CR>', nil)
map("n", "<leader>1", ':lua require("harpoon.ui").nav_file(1)<CR>', nil)
map("n", "<leader>2", ':lua require("harpoon.ui").nav_file(2)<CR>', nil)
map("n", "<leader>3", ':lua require("harpoon.ui").nav_file(3)<CR>', nil)
map("n", "<leader>4", ':lua require("harpoon.ui").nav_file(4)<CR>', nil)
map("n", "<leader>4", ':lua require("harpoon.ui").nav_file(4)<CR>', nil)

map("n", ",<Space>", ":nohlsearch<CR>", { silent = true })

map("n", "<C-l>", '<C-w>l', nil)
map("n", "<C-h>", '<C-w>h', nil)
map("n", "<C-j>", '<C-w>j', nil)
map("n", "<C-k>", '<C-w>k', nil)

map("n", "<leader>r", ':lua vim.lsp.buf.references()<CR>', nil)

map("n", "<leader>m", ':Neogit<CR>', nil)

map("v", "<leader>\\", "<cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", nil)

map("n", "<leader>h", "<cmd>ClangdSwitchSourceHeader<CR>", nil)

map("n", "<leader>wl", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", nil)
map("n", "<leader>wa", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", nil)


map("n", "<leader>wc", ":lua require('config.git_worktree').CreateBranch()<CR>", nil)

