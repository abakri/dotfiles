local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = true,
})

lsp.ensure_installed({
    "tsserver",
    "rust_analyzer",
    "pylsp",
})

lsp.configure("lua_ls", {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})

lsp.configure("pylsp", {
    settings = {
        pylsp = {
            plugins = {
                autopep8 = {
                    enabled = false,
                },
                pycodestyle = {
                    enabled = true,
                    maxLineLength = 100,
                },
                yapf = {
                    enabled = true,
                },
                pydocstyle = {
                    enabled = true,
                    convention = "google",
                },
                rope_auto_import = {
                    enabled = true,
                },
                rope_completion = {
                    enabled = true,
                },
            }
        }
    }
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = true,
})

