local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.builtin, {})
vim.keymap.set("n", "<leader>pg", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})

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
            }
        },
    },
})

require("telescope").load_extension("fzf")
