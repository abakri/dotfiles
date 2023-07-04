return {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "stevearc/dressing.nvim",
    },
    keys = {
        { '<leader>Fr', '<cmd>:FlutterRun --flavor dev<CR>', desc = 'Flutter run' },
    },
    opts = {
        fvm = true,
        dev_tools = {
            autostart = true,
            auto_open_browser = true,
        },
        widget_guides = {
            enabled = true,
            debug = true,
        },
        debugger = {
            enabled = true,
            run_via_dap = true,
        },
    },
}
