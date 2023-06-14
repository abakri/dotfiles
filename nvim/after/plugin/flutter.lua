require("flutter-tools").setup({
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
})
