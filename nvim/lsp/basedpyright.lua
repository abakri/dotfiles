vim.lsp.config("basedpyright", {
    cmd = { 'basedpyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = {
        'pyrightconfig.json',
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        'Pipfile',
        '.git',
    },
    settings = {
        basedpyright = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = 'openFilesOnly',
            },
        },
    },
})

-- Old pyright config
-- vim.lsp.config("pyright", {
--     cmd = { "pyright-langserver", "--stdio" },
--     filetypes = { "python" },
--     root_markers = {
--         "pyproject.toml",
--         "setup.py",
--         "setup.cfg",
--         "requirements.txt",
--         "Pipfile",
--         "pyrightconfig.json",
--     },
--     capabilities = {
--         workspace = {
--             didChangeConfiguration = {
--                 dynamicRegistration = false,
--             },
--         },
--     },
--     settings = {
--         pyright = { disableOrganizeImports = true },
--         python = {
--             analysis = {
--                 autoImportCompletions = true,
--                 diagnosticMode = "openFilesOnly",
--                 typeCheckingMode = "standard",
--                 autoSearchPaths = true,
--                 useLibraryCodeForTypes = true,
--                 -- ignore = { "*" },
--             },
--         },
--     },
-- }
