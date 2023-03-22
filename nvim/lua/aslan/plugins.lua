-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- vim tutorial
    use 'ThePrimeagen/vim-be-good'

    -- color schemes
    use "EdenEast/nightfox.nvim"
    use "navarasu/onedark.nvim"
    use "folke/tokyonight.nvim"

    use("christoomey/vim-tmux-navigator")

    use "shortcuts/no-neck-pain.nvim"

    -- navigation
    use 'nvim-lua/plenary.nvim'
    use { 'nvim-telescope/telescope-fzf-native.nvim', run =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use 'ThePrimeagen/harpoon'
    use {
        "ggandor/leap.nvim",
        config = function() require("leap").set_default_keymaps() end
    }

    use "nvim-tree/nvim-web-devicons"

    -- vim surround
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    })

    -- split/join
    use({
        'Wansmer/treesj',
        requires = { 'nvim-treesitter' },
    })

    -- git
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- status bar
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- nvimtree
    use {
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icons
        },
        tag = "nightly"                    -- optional, updated every week. (see issue #1193)
    }

    -- noice cmd line (not using notifications)
    use({
        "folke/noice.nvim",
        requires = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
        }
    })


    -- treesitter and lsp
    use("nvim-treesitter/nvim-treesitter", { run = ':TSUpdate' })
    use 'nvim-treesitter/nvim-treesitter-context'
    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    })
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }
end)
