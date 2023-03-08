local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black, -- python code formatting
        null_ls.builtins.formatting.isort, -- python import sorting
        null_ls.builtins.diagnostics.mypy, -- python type checking
        null_ls.builtins.diagnostics.ruff.with({
            extra_args = {"--config", "~/.config/nvim/config/ruff.toml"}
        }), -- python linting
    }
})
