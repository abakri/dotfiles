vim.lsp.config("glsl_analyzer", {
    capabilities = {},
    cmd = { "glsl_analyzer" },
    filetypes = { "glsl", "vert", "tesc", "tese", "frag", "geom", "comp" },
    root_markers = {},
})

