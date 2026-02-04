return {
    -- color schemes
    "franbach/miramare",
    {
        'f4z3r/gruvbox-material.nvim',
        name = 'gruvbox-material',
        lazy = false,
        priority = 1000,
        config = function()
            require("gruvbox-material").setup({ contrast = "hard" })
        end
    },
    { 'projekt0n/github-nvim-theme', name = "github-nvim-theme" },
    { "catppuccin/nvim", name = "catppuccin", opts = { flavour = "frappe" } },
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
            { "<leader>pg", "<cmd>FzfLua files<cr>",          desc = "Files" },
            { "<leader>t",  "<cmd>FzfLua resume<cr>",         desc = "Resume" },
            { "<leader>ps", "<cmd>FzfLua live_grep<cr>",      desc = "Grep" },
            { "gr",         "<cmd>FzfLua lsp_references<cr>", desc = "LSP References" },
        },
        opts = {
            winopts = {
                preview = {
                    vertical = "up:60%",
                    layout = "vertical"
                }
            },
            grep = {
                rg_glob = true
            }
        },
    },

    -- github
    {
        "almo7aya/openingh.nvim", -- :OpenInGHFileLines
        keys = {
            { "gh", "<cmd>OpenInGHFileLines<cr>", desc = "Open in Github" },
        },
    },
    -- git blame
    {
        "FabijanZulj/blame.nvim", -- :ToggleBlame
    },

    -- tmux integration
    {
        "christoomey/vim-tmux-navigator",
    },
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
    {
        "mason-org/mason.nvim",
        opts = {}
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
    { "tpope/vim-abolish" },
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
            { '<leader>o', '<cmd>Oil --float<cr>', desc = 'Open Oil' }
        },
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "hat0uma/csvview.nvim",
        opts = {
            parser = { comments = { "#", "//" } },
            keymaps = {
                -- Text objects for selecting fields
                textobject_field_inner = { "if", mode = { "o", "x" } },
                textobject_field_outer = { "af", mode = { "o", "x" } },
                -- Excel-like navigation:
                -- Use <Tab> and <S-Tab> to move horizontally between fields.
                -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
                -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
                jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
                jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
                jump_next_row = { "<Enter>", mode = { "n", "v" } },
                jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
            },
            view = { display_mode = "border" }
        },
        cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
    },
    {
        "kndndrj/nvim-dbee",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        build = function()
            -- Install tries to automatically detect the install method.
            -- if it fails, try calling it with one of these parameters:
            --    "curl", "wget", "bitsadmin", "go"
            require("dbee").install()
        end,
        config = function()
            require("dbee").setup( --[[optional config]])
        end,
        keys = {
            { "<leader>db", function()
                require("dbee").open()
            end }
        }
    },
}
