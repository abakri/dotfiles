return {
    -- color schemes
    "EdenEast/nightfox.nvim",
    "franbach/miramare",
    "folke/tokyonight.nvim",
    "navarasu/onedark.nvim",
    'projekt0n/github-nvim-theme',
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        opts = {
            flavour = "frappe"
        },
    },
    -- center buffer
    "shortcuts/no-neck-pain.nvim",
    -- indent lines
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            whitespace = {
                remove_blankline_trail = true,
            },
            scope = { enabled = false },
        },
    },

    -- github
    {
        "almo7aya/openingh.nvim",
        lazy = false,
        keys = {
            "<leader>gh", "<cmd>:OpenInGHFileLines<cr>", desc = "Open in GitHub",
        },
        config = function()
            require('openingh').setup({})
        end
    },

    -- tmux integration
    "christoomey/vim-tmux-navigator",
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },

    -- copilot
    "github/copilot.vim",

    -- split/join
    {
        'Wansmer/treesj',
        keys = {
            { 'gs', '<cmd>lua require("treesj").toggle()<CR>', desc = 'Treesj toggle' },
        },
        dependencies = { 'nvim-treesitter' },
        config = function()
            require('treesj').setup({})
        end
    },

    -- notifications
    {
        "rcarriga/nvim-notify",
        config = function()
            require('notify').setup({
                stages = 'static',
                render = 'minimal',
                top_down = false, -- put at bottom
            })
        end
    },

    -- dap add ons
    {
        "theHamsta/nvim-dap-virtual-text",
        opts = {
            commented = true,
        }
    },
    "rcarriga/nvim-dap-ui",
    "nvim-telescope/telescope-dap.nvim",
    {
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    -- context at top
    {
        'nvim-treesitter/nvim-treesitter-context',
        opts = {
            enable = true,
            max_lines = 3,
        },
    },
    -- commenting
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()
            require('mini.comment').setup()
        end
    },
    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        opts = {},
    },
    -- renaming files no refactors imports
    {
        'antosha417/nvim-lsp-file-operations',
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-tree.lua",
        }
    },
    {
        'dmmulroy/tsc.nvim',
        keys = {
            { '<leader>wd', '<cmd>TSC<CR>', desc = 'Run typescript project diagnostics' },
        },
        opts = {
            auto_open_qflist = true,
        },
        config = function(_, opts) require('tsc').setup(opts) end,
    },
    {
        "ecthelionvi/NeoComposer.nvim",
        dependencies = { "kkharji/sqlite.lua" },
        opts = {}
    },
}
