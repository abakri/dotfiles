local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>pv", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})

require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<Esc>"] = actions.close,
            },
        },
    },
})

