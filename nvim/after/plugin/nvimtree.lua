-- examples for your init.lua

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup({
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
            enable = true,
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
})
