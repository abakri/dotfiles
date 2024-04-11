return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    tag = "nightly",                   -- optional, updated every week. (see issue #1193)
    keys = {
        { '<leader>e',  '<cmd>:NvimTreeFindFile<CR>zz',                                       desc = 'NvimTreeFindFile' },
        { '<C-n>',      '<cmd>lua require("nvim-tree.api").tree.toggle({focus = false})<CR>', desc = 'NvimTreeToggle' },
        { '<leader>gN', '<cmd>lua require("nvim-tree.api").tree.toggle({focus = false})<CR>', desc = 'NvimTreeToggle' },
    },
    opts = {
        update_focused_file = {
            enable = true,
        }, -- the current opened buffer should be focused in nvim tree
        renderer = {
            highlight_opened_files = "all",
        },
        disable_netrw = true,
        hijack_netrw = true,
        respect_buf_cwd = false,
        sync_root_with_cwd = false,
        actions = {
            open_file = {
                resize_window = true,
            }
        },
        view = {
            width = 60,
            relativenumber = true,
            centralize_selection = true,
            side = "right",
            preserve_window_proportions = true,
        },
        filters = {
            dotfiles = false,
        },
        git = {
            enable = true,
            ignore = false,
        }
    },
}
