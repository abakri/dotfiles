return {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    lazy = false,
    keys = {
        {
            '<leader>ll',
            [[ <cmd> lua require('lsp_lines').toggle(); require('notify')('lsp_lines toggled'); <cr> ]],
            desc = 'Toggle lsp lines'
        },
    },
    config = function()
        vim.diagnostic.config({
            virtual_text = false,     -- if not using lsp_lines
        })
        require("lsp_lines").setup()
    end,
}
