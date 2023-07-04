return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "nvim-telescope/telescope-dap.nvim",
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
    },
    keys = {
        { '<leader>b', '<cmd>lua require("dap").toggle_breakpoint()<CR>', desc = 'DAP toggle breakpoint' },
    },
    config = function()
        local dap_breakpoint = {
            error = {
                text = "B",
                texthl = "LspDiagnosticsSignError",
                linehl = "",
                numhl = "",
            },
            rejected = {
                text = "",
                texthl = "LspDiagnosticsSignHint",
                linehl = "",
                numhl = "",
            },
            stopped = {
                text = ">",
                texthl = "LspDiagnosticsSignInformation",
                linehl = "DiagnosticUnderlineInfo",
                numhl = "LspDiagnosticsSignInformation",
            },
        }

        vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
        vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
        vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)

        local dap, dapui = require("dap"), require("dapui")
        dapui.setup({})

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        dap.adapters.dart = {
            type = "executable",
            command = "/Users/aslan/opt/flutter/bin/flutter",
            args = { "debug_adapter" }
        }

        dap.configurations = {
            dart = {
                type = "dart",
                request = "launch",
                name = "Launch Dart Program",
                -- The nvim-dap plugin populates this variable with the filename of the current buffer
                program = "${file}",
                -- The nvim-dap plugin populates this variable with the editor's current working directory
                cwd = "${workspaceFolder}",
                args = { "--help" },     -- Note for Dart apps this is args, for Flutter apps toolArgs
            }
        }
    end
}
