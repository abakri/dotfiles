local function get_python_virtual_env_location()
    return os.getenv("VIRTUAL_ENV")
end

return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-neotest/nvim-nio",
        "antoinemadec/FixCursorHold.nvim",
        'haydenmeade/neotest-jest',
        'sidlatau/neotest-dart',
        "nvim-neotest/neotest-python",
    },
    keys = {
        { '<leader>Tr', '<cmd>lua require("neotest").run.run()<CR>',                   desc = 'Neotest run' },
        { '<leader>Td', '<cmd>lua require("neotest").run.run({strategy = "dap"})<CR>', desc = 'Neotest run with dap' },
        { '<leader>Tf', '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', desc = 'Neotest run file' },
        {
            '<leader>To',
            '<cmd>lua require("neotest").output_panel.toggle()<CR>',
            desc =
            'Neotest toggle output panel'
        },
        {
            '<leader>Tc',
            '<cmd>lua require("neotest").output_panel.clear()<CR>',
            desc =
            'Neotest clear output panel'
        },
        { '<leader>Ts', '<cmd>lua require("neotest").summary.toggle()<CR>', desc = 'Neotest toggle summaray' },
    },
    config = function()
        require('neotest').setup({
            adapters = {
                require('neotest-dart')({
                    command = 'fvm flutter', -- Command being used to run tests. Defaults to `flutter`
                    use_lsp = true           -- When set Flutter outline information is used when constructing test name.
                }),
                require('neotest-jest')({
                    jestCommand = "yarn jest",
                    jestConfigFile = "custom.jest.config.ts",
                    env = { CI = true },
                    cwd = function(_)
                        return vim.fn.getcwd()
                    end,
                }),
                require("neotest-python")({
                    dap = { justMyCode = false },
                    runner = "pytest",
                    args = {
                        "--no-cov",
                        "--tb=long",
                        "-vv",
                        "--capture=no",
                    },
                    python = string.format("%s/bin/python", get_python_virtual_env_location()),
                }),
            },
            output_panel = {
              enabled = true,
              open = "botright split | resize 50"
            },
        })
    end
}
