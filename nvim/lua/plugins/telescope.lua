return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            "nvim-telescope/telescope-live-grep-args.nvim",
            -- This will not install any breaking changes.
            -- For major updates, this must be adjusted manually.
            version = "^1.0.0",
        }
    },
    keys = {
        {
            '<leader>pf',
            '<cmd>lua require("telescope.builtin").find_files()<cr>',
            desc =
            "Telescope find files"
        },
        {
            '<C-p>',
            '<cmd>lua require("telescope.builtin").builtin()<cr>',
            desc =
            "Telescope built-in"
        },
        {
            '<leader>pg',
            '<cmd>lua require("telescope.builtin").git_files()<cr>',
            desc =
            "Telescope git files"
        },
        {
            '<leader>ps',
            '<cmd>lua require("telescope").extensions.live_grep_args.live_grep_args()<cr>',
            desc =
            "Telescope live grep with arguments"
        },
        {
            'gr',
            '<cmd>lua require("telescope.builtin").lsp_references()<cr>',
            desc =
            "Telescope LSP references"
        },
        {
            'gd',
            '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>',
            desc =
            "Telescope LSP definitions"
        },
        { '<leader>t',  '<cmd>lua require("telescope.builtin").resume()<cr>',      desc = "Telescope resume" },
        { '<leader>gd', '<cmd>lua require("telescope.builtin").diagnostics()<cr>', desc = "Telescope diagnostics" },
        { '<leader>bl', '<cmd>lua require("telescope.builtin").buffers()<cr>',     desc = "Telescope open buffers" },
        { '<leader>bp', '<cmd>lua require("telescope.builtin").oldfiles()<cr>',    desc = "Telescope open old files" },
    },
    config = function()
        local actions = require("telescope.actions")
        require("telescope").setup({
            pickers = {
                find_files = {
                    hidden = true,
                    follow = true,
                    no_ignore = true,
                    no_ignore_parent = true,
                },
                git_files = {
                    hidden = true,
                    follow = true,
                },
                live_grep = {
                    hidden = true,
                    follow = true,
                },
            },
            defaults = {
                layout_strategy = "vertical",
                path_display = { truncate = 2 },
                mappings = {
                    i = {
                        ["<Esc>"] = actions.close,
                        ["<C-n>"] = actions.cycle_history_next,
                        ["<C-p>"] = actions.cycle_history_prev,
                    },
                    n = {
                        ["q"] = actions.close,
                        ["<C-n>"] = actions.cycle_history_next,
                        ["<C-p>"] = actions.cycle_history_prev,
                        ["<C-a>"] = actions.add_selected_to_qflist,
                    }
                },
            },
        })
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("notify")
        require("telescope").load_extension("live_grep_args")
    end,
}
