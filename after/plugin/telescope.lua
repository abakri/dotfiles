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
            layout_strategy = "horizontal",
            theme = "dropdown",
            layout_config = {
                width = 0.75,
                height = 0.75,
                preview_width = 0.75,
            },
        },
        git_files = {
            hidden = true,
            follow = true,
            layout_strategy = "horizontal",
            theme = "dropdown",
            layout_config = {
                width = 0.75,
                height = 0.75,
                preview_width = 0.75,
            },
        },
        live_grep = {
            hidden = true,
            follow = true,
            layout_strategy = "horizontal",
            theme = "dropdown",
            layout_config = {
                width = 0.75,
                height = 0.75,
                preview_width = 0.75,
            },
        },
    },
    defaults = {
        path_display = { truncate = 2 },
        mappings = {
            i = {
                    ["<Esc>"] = actions.close,
            },
            n = {
                    ["q"] = actions.close,
            }
        },
    },
})
