vim.keymap.set('n', '<leader>Tr', '<cmd>lua require("neotest").run.run()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>Td', '<cmd>lua require("neotest").run.run({strategy = "dap"})<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>Tf', '<cmd> lua require("neotest").run.run(vim.fn.expand("%"))<CR>', { noremap = true, silent = true })

require('neotest').setup({
    adapters = {
        require('neotest-dart') {
            command = 'fvm flutter', -- Command being used to run tests. Defaults to `flutter`
            use_lsp = true           -- When set Flutter outline information is used when constructing test name.
        },
    }
})
