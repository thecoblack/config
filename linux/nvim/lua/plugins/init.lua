vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use) 
    use "wbthomason/packer.nvim"
    -- use {'kyazdani42/nvim-web-devicons'}
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

    use {"williamboman/nvim-lsp-installer"}
    use {'neovim/nvim-lspconfig'}


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
    use {'akinsho/bufferline.nvim', tag = "v2.*"}
    use {'kyazdani42/nvim-tree.lua', tag='nightly'}

end)
