-- examples for your init.lua

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local WIDTH_RATIO = 0.3  -- You can change this too

-- empty setup using defaults
require("nvim-tree").setup({
    disable_netrw = true,
    hijack_netrw = true,
    respect_buf_cwd = true,
    sync_root_with_cwd = true,
    view = {
        relativenumber = true,
        width = function()
            return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
        end,
    },
    filters = {
        dotfiles = false,
    },
    git = {
        enable = true,
        ignore = false,
    }
})
