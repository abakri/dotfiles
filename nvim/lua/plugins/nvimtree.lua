return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",     -- optional, for file icons
    },
    tag = "nightly",                       -- optional, updated every week. (see issue #1193)
    keys = {
        { '<leader>e', '<cmd>:NvimTreeFindFile<CR>zz', desc = 'NvimTreeFindFile' },
        { '<C-n>',     '<cmd>:NvimTreeToggle<CR>',     desc = 'NvimTreeToggle' },
    },
    opts = {
        disable_netrw = true,
        hijack_netrw = true,
        respect_buf_cwd = true,
        sync_root_with_cwd = true,
        view = {
            centralize_selection = true,
            adaptive_size = false,
            side = "right",
            preserve_window_proportions = true,
            float = {
                enable = false,
                quit_on_focus_loss = false,
                open_win_config = function()
                    return {
                        row = 0,
                        width = 40,
                        border = "rounded",
                        relative = "editor",
                        col = vim.o.columns,
                        height = vim.o.lines,
                    }
                end,
            },
        },
        filters = {
            dotfiles = false,
        },
        git = {
            enable = true,
            ignore = false,
        }
    }
}
