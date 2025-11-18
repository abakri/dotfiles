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
    -- fzf-lua
    {
      "ibhagwan/fzf-lua",
      -- optional for icon support
      dependencies = { "nvim-tree/nvim-web-devicons" },
      keys = {
          {"<leader>pg", "<cmd>FzfLua files<cr>", desc = "Files"},
          {"<leader>t", "<cmd>FzfLua resume<cr>", desc = "Resume"},
          {"<leader>ps", "<cmd>FzfLua live_grep<cr>", desc = "Grep"}
      },
      opts = {
          winopts = {
              preview = {
                  vertical = "up:60%",
                  layout = "vertical"
              }
          }
      },
    },

    -- github
    {
        "almo7aya/openingh.nvim", -- :OpenInGHFileLines
    },
    -- git blame
    {
        "FabijanZulj/blame.nvim", -- :ToggleBlame
    },

    -- tmux integration
    {
        "christoomey/vim-tmux-navigator",
    },
    -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

    -- copilot # NOT USING ANYMORE
    --"github/copilot.vim",

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

    -- mason (installer)
    { "williamboman/mason.nvim" },

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
    --[[ Seems unreliable
    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        opts = {
            on_attach = function(client)
                client.resolved_capabilities.document_formatting = false
            end,
        },
    },
    --]]
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
        'stevearc/aerial.nvim',
        keys = {
            { 'gA', '<cmd>AerialToggle! left<CR>', desc = 'Toggle Aerial' },
        },
        opts = {
            min_width = 30,
            max_width = { 50, 0.3 }
        },
        -- Optional dependencies
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
    },
    {
        "tpope/vim-abolish",
    },
    {
        "nvim-pack/nvim-spectre",
        keys = {
            { '<leader>S', '<cmd>lua require("spectre").toggle()<cr>', desc = 'Spectre Toggle' },
        },
    },
    {
        'stevearc/oil.nvim',
        opts = {},
        keys = {
            { '<leader>O', '<cmd>Oil --float<cr>', desc = 'Open Oil' }
        },
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        'echasnovski/mini.files',
        version = '*',
        config = function()
            require('mini.files').setup()
        end,
        keys = {
            { '<leader>o', '<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<cr>', desc = 'Open mini files' }
        }
    },
    {
        "m4xshen/hardtime.nvim",
        lazy = false,
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {},
    },
}
