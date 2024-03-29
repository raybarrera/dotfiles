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
    use 'ray-x/go.nvim'
    use 'ray-x/guihua.lua'
    use 'onsails/lspkind-nvim' -- vscode-like pictograms
    use 'neovim/nvim-lspconfig' -- Configurations for LSP
    -- CMP
    use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use "rafamadriz/friendly-snippets"
    use({ "L3MON4D3/LuaSnip", tag = "v2.*", run = "make install_jsregexp" })
    use 'saadparwaiz1/cmp_luasnip' -- for cmp-luasnip integration
    use {
        'zbirenbaum/copilot.lua',
    }
    use {
        'zbirenbaum/copilot-cmp',
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    use 'vrischmann/tree-sitter-templ'
    use {
        'akinsho/flutter-tools.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim',
        },
    }
    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use 'nvim-telescope/telescope-file-browser.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        'akinsho/nvim-bufferline.lua',
        requires = 'nvim-tree/nvim-web-devicons',
        tag = 'v4.*',
    }
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use { 'lewis6991/gitsigns.nvim' }
    use { 'wuelnerdotexe/vim-astro' }
end)
