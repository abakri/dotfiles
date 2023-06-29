return {
    -- vim tutorial
    'ThePrimeagen/vim-be-good',

    -- color schemes
    "EdenEast/nightfox.nvim",
    "navarasu/onedark.nvim",
    "folke/tokyonight.nvim",
    "franbach/miramare",

    "christoomey/vim-tmux-navigator",

    -- indent lines
    "lukas-reineke/indent-blankline.nvim",

    "shortcuts/no-neck-pain.nvim",

    -- navigation
    'nvim-lua/plenary.nvim',
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    'ThePrimeagen/harpoon',
    {
        "folke/flash.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require('flash').setup({
                -- disable 'f' and 't' with flash
                modes = {
                    char = {
                        enabled = false,
                    }
                },
                label = {
                    format = function(opts)
                        return {
                            {
                                "[" .. opts.match.label .. "]",
                                opts.match.hl_group,
                            }
                        }
                    end
                }
            })
        end
    },

    "nvim-tree/nvim-web-devicons",

    -- copilot
    "github/copilot.vim",

    -- test runner
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            'sidlatau/neotest-dart',
        },
    },

    -- split/join
    {
        'Wansmer/treesj',
        dependencies = { 'nvim-treesitter' },
    },

    -- git
    { 'sindrets/diffview.nvim',          dependencies = 'nvim-lua/plenary.nvim' },

    -- status bar
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
    },

    -- nvimtree
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icons
        },
        tag = "nightly"                    -- optional, updated every week. (see issue #1193)
    },

    -- noice cmd line (not using notifications)
    {
        "folke/noice.nvim",
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
        }
    },

    -- dap (debugger)
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
    "nvim-telescope/telescope-dap.nvim",
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "nvim-telescope/telescope-dap.nvim",
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
        },
    },

    -- Markdown preview
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    },

    -- Flutter
    "stevearc/dressing.nvim",
    {
        "akinsho/flutter-tools.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "stevearc/dressing.nvim",
        },
    },

    -- treesitter and lsp
    { "nvim-treesitter/nvim-treesitter", { build = ':TSUpdate' } },
    'nvim-treesitter/nvim-treesitter-context',
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
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
    },

    --[[ A bit too buggy for now
    use {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        config = function()
            require("typescript-tools").setup {}
        end,
    }
    --]]
    -- docstrings
    {
        "danymat/neogen",
        config = function()
            require('neogen').setup {}
        end,
        dependencies = "nvim-treesitter/nvim-treesitter",
        -- Uncomment next line if you want to follow only stable versions
        -- tag = "*"
    }
}
