vim.lsp.config("pyright", {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = {
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        "Pipfile",
        "pyrightconfig.json",
    },
    capabilities = {
        workspace = {
            didChangeConfiguration = {
                dynamicRegistration = false,
            },
        },
    },
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

