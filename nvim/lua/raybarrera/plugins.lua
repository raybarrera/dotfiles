local status, packer = pcall(require, 'packer')
if (not status) then
    print("Packer is not installed")
    return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
    use 'sainnhe/sonokai'
    use 'wbthomason/packer.nvim' -- Package Manager
    use 'rebelot/kanagawa.nvim'
    use 'tpope/vim-fugitive'
    use 'fatih/vim-go'
    use 'ray-x/lsp_signature.nvim'
    use 'onsails/lspkind-nvim' -- vscode-like pictograms
    use 'neovim/nvim-lspconfig' -- Configurations for LSP
    -- CMP
    use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
    use 'hrsh7th/cmp-buffer'
    use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    use "rafamadriz/friendly-snippets"
    use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
    use 'saadparwaiz1/cmp_luasnip'-- for cmp-luasnip integration

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
                local ts_update = require('nvim-treesitter.install').update({with_sync=true})
                ts_update()
        end,
    }
    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'nvim-telescope/telescope-file-browser.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup{} end
    }
    use {'lewis6991/gitsigns.nvim'}
end)
