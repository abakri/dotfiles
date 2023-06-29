return {
    "folke/flash.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {
        -- disable 'f' and 't' with flash
        modes = {
            char = {
                enabled = false,
            }
        },
        -- add square brackets to label
        label = {
            format = function(opts)
                return {
                    {
                        "[" .. opts.match.label .. "]",
                        opts.match.hl_group,
                    }
                }
            end
        }
    }
}
