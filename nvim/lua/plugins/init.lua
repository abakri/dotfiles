return {
    -- color schemes
    "EdenEast/nightfox.nvim",
    "navarasu/onedark.nvim",
    "folke/tokyonight.nvim",
    {
        "franbach/miramare",
        lazy = false,
        config = function() vim.cmd("colorscheme miramare") end,
    },

    -- indent lines
    {
        "lukas-reineke/indent-blankline.nvim",
        opts = {
            char = "▏",
            show_current_context = true,
        }
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

    -- surround
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function() require('mini.surround').setup() end,
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

    -- {
    --     'jose-elias-alvarez/null-ls.nvim',
    --     config = function()
    --         local null_ls = require('null-ls')
    --         null_ls.setup({
    --             sources = {
    --                 null_ls.builtins.formatting.prettierd,
    --             }
    --         })
    --     end
    --
    -- },
}
