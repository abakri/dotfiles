return {
    'ThePrimeagen/harpoon',
    keys = {
        { '<leader>0', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', desc = 'Harpoon toggle quick menu' },
        { '<leader>`', '<cmd>lua require("harpoon.mark").add_file()<CR>',        desc = 'Harpoon add file' },
        { '<leader>1', '<cmd>lua require("harpoon.ui").nav_file(1)<CR>',         desc = 'Harpoon nav file 1' },
        { '<leader>2', '<cmd>lua require("harpoon.ui").nav_file(2)<CR>',         desc = 'Harpoon nav file 2' },
        { '<leader>3', '<cmd>lua require("harpoon.ui").nav_file(3)<CR>',         desc = 'Harpoon nav file 3' },
        { '<leader>4', '<cmd>lua require("harpoon.ui").nav_file(4)<CR>',         desc = 'Harpoon nav file 4' },
        { '<leader>5', '<cmd>lua require("harpoon.ui").nav_file(5)<CR>',         desc = 'Harpoon nav file 5' },
    },
    opts = {
        menu = {
            width = math.floor(vim.api.nvim_win_get_width(0) * 0.65),
        }
    }
}
