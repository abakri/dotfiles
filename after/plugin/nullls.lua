require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.black,             -- python code formatting
        require("null-ls").builtins.formatting.isort,             -- python import sorting
    }
})
