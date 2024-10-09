return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },             -- Required
        { 'williamboman/mason.nvim' },           -- Optional
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional
        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },                  -- Required
        { 'hrsh7th/cmp-nvim-lsp' },              -- Required
        { 'L3MON4D3/LuaSnip' },                  -- Required
        -- External signature
        { 'ray-x/lsp_signature.nvim' },

        -- Python indentation
        { 'Vimjas/vim-python-pep8-indent' },
    },
    config = function()
        local lsp = require('lsp-zero').preset({})

        lsp.ensure_installed({
            "rust_analyzer",
            "pyright",
            "jsonls",
            "tsserver",
            "ruff_lsp",
            -- "pylyzer",
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

        lsp.configure("pyright", {
            settings = {
                pyright = { disableOrganizeImports = true },
                python = {
                    analysis = {
                        autoImportCompletions = true,
                        diagnosticMode = "openFilesOnly",
                        typeCheckingMode = "standard",
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true,
                        -- ignore = { "*" },
                    },
                },
            },
        })

        lsp.configure("ruff_lsp", { settings = {} })
        -- lsp.configure("pylyzer", {settings = {}})

        lsp.configure("graphql", {})

        lsp.configure("tsserver", {})

        lsp.on_attach(function(_, bufnr)
            lsp.default_keymaps({ buffer = bufnr })
        end)

        -- (Optional) Configure lua language server for neovim
        require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

        lsp.setup()

        -- Setup cmp
        local cmp = require('cmp')
        cmp.setup({
            mapping = {
                -- `Enter` key to confirm completion
                ['<CR>'] = cmp.mapping.confirm({ select = false })
            }
        })
    end
}
