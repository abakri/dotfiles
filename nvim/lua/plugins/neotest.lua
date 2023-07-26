return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        'haydenmeade/neotest-jest',
        'sidlatau/neotest-dart',
    },
    keys = {
        { '<leader>Tr', '<cmd>lua require("neotest").run.run()<CR>',                   desc = 'Neotest run' },
        { '<leader>Td', '<cmd>lua require("neotest").run.run({strategy = "dap"})<CR>', desc = 'Neotest run with dap' },
        { '<leader>Tf', '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', desc = 'Neotest run file' },
    },
    config = function()
        require('neotest').setup({
            adapters = {
                require('neotest-dart')({
                    command = 'fvm flutter', -- Command being used to run tests. Defaults to `flutter`
                    use_lsp = true           -- When set Flutter outline information is used when constructing test name.
                }),
                require('neotest-jest')({
                    jestCommand = "npm test --",
                    jestConfigFile = "custom.jest.config.ts",
                    env = { CI = true },
                    cwd = function(_)
                        return vim.fn.getcwd()
                    end,
                }),
            }
        })
    end
}
