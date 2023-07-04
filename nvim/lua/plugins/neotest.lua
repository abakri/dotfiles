return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        'sidlatau/neotest-dart',
    },
    keys = {
        { 'leaderTr', '<cmd>lua require("neotest").run.run()<CR>',                   desc = 'Neotest run' },
        { 'leaderTd', '<cmd>lua require("neotest").run.run({strategy = "dap"})<CR>', desc = 'Neotest run with dap' },
        { 'leaderTf', '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', desc = 'Neotest run file' },
    },
    config = function()
        require('neotest').setup({
            adapters = {
                require('neotest-dart') {
                    command = 'fvm flutter',     -- Command being used to run tests. Defaults to `flutter`
                    use_lsp = true               -- When set Flutter outline information is used when constructing test name.
                },
            }
        })
    end
}
