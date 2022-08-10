vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use) 
    use "wbthomason/packer.nvim"
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-fzf-native.nvim', run="make"},
            {'nvim-telescope/telescope-symbols.nvim'},
        },
    }
    use {'nvim-telescope/telescope-project.nvim'}

    use {'neovim/nvim-lspconfig'}
    use {"williamboman/nvim-lsp-installer"}
    --use {"rishabhrd/nvim-lsputils"}
    --use {
     --   "neovim/nvim-lspconfig",
      --  opt=true,
       -- event="BufReadPre",
        --wants={"nvim-lsp-installer", "lsp_signature.nvim", "cmp-nvim-lsp"},
        --requires={
         --   "williamboman/nvim-lsp-installer",
          --  "ray-x/lsp_signature.nvim",
        --},
   -- }

    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use {"gruvbox-community/gruvbox"}
    use {"folke/tokyonight.nvim"}

    use {"hrsh7th/nvim-cmp"}
    use {"hrsh7th/cmp-nvim-lsp"}
    use {"hrsh7th/cmp-buffer"}
    use {"hrsh7th/cmp-path"}
    use {"hrsh7th/cmp-cmdline"}

    use {'editorconfig/editorconfig-vim'}

    use {'b3nj5m1n/kommentary'}
end)
